package com.client;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import protobuf.Utils;
import protobuf.analysis.ParseMap;
import protobuf.generate.cli2srv.chat.Chat;
import protobuf.generate.cli2srv.login.Auth;
import protobuf.generate.internal.Internal;

import com.google.protobuf.ByteString;
import com.google.protobuf.Message;


/**
 * 聊天管理
 */
public class ClientHandler extends SimpleChannelInboundHandler<Message> {
    public static ChannelHandlerContext _gateClientConnection;
    //验证是否登录
    // boolean _verify = false;
    static boolean _close = true;
    
    
//    public static ChatActivity chart=null; //安卓本身处理
//	public static F_MSG fmsg=null;//安卓本身处理
//	public static GlobalVariable app;//安卓本身处理
//
    /**
     * 连接上服务器后 会调一次
     * @param ctx
     * @throws IOException
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws IOException {
        _gateClientConnection = ctx;
        //没做验证  密码没用
        String passwd = "123";
//        app = GlobalVariable.getInstance(); //安卓本身处理
//        sendCLogin(ctx, app.getUserId(), passwd);
    }


    /**
     * 登录信息
     *
     * @param ctx
     * @param userid
     * @param passwd
     */
    void sendCLogin(ChannelHandlerContext ctx, String userid, String passwd) {
        Auth.CLogin.Builder loginInfo = Auth.CLogin.newBuilder();
        loginInfo.setUserid(userid);
        loginInfo.setPasswd(passwd);
        loginInfo.setType(Auth.Type.android);

        ByteBuf byteBuf = Utils.pack2Client(loginInfo.build());
        ctx.writeAndFlush(byteBuf);

    }

    /**
     * 客户端收到新的数据时，这个方法会在收到消息时被调用
     *
     * @param channelHandlerContext
     * @param msg
     * @throws Exception
     */
    @Override
    protected void channelRead0(ChannelHandlerContext channelHandlerContext, Message msg) throws Exception {
		System.out.println("DDHZH"+"received message: {}" + msg.getClass());
        //登录成功（连上服务器后给的反馈）
        if (msg instanceof Auth.SResponse) {
            Auth.SResponse sp = (Auth.SResponse) msg;
            int code = sp.getCode();
            String desc = sp.getDesc();
            switch (code) {
                //登录成功
                case Common.VERYFY_PASSED:
					System.out.println("DDHZH"+"Login succeed, description: {}" + desc);
                    System.out.println("上线人数："+sp.getOnLineUsersList().size());
                    //收离线消息 （注意：离线消息收到后服务器将自动删除，请先把消息存到本地）
                    Chat.CListChat.Builder cp = Chat.CListChat.newBuilder();
                    ByteBuf byteBuf = Utils.pack2Client(cp.build());
                    _gateClientConnection.writeAndFlush(byteBuf);
                    //_verify = true;
//                    app.setChatState(true);
                    break;
                //强制下线（被其他地方登陆）
                case Common.VERYFY_ERROR:
                    //客服端做相应的处理，服务端会强行停掉这个连接
					System.out.println("DDHZH"+"Login succeed, description: {}" + desc);
                    closeChannel();
//                    TipsChat(GlobalConstant.SHOW_NO_LOGIN, "");
                    break;
                default:
					System.out.println("DDHZH"+"Unknow code: {}" + code);
            }
           
        } 
        
        //接受到新消息 处理
        else if (msg instanceof Internal.GTransfer) {
            //得到服务端处理的数据
            Internal.GTransfer gt = (Internal.GTransfer) msg;
            Message mess = ParseMap.getMessage(gt.getPtoNum(), gt.getMsg().toByteArray());
            //转为客服端的数据类型
            Chat.CPrivateChat ccp = (Chat.CPrivateChat) mess;
			System.out.println("DDHZH"+"{} 来消息了----------------: {}.Total:{}" + ccp.getDest() + ccp.getContent());
            receiveMsg(ccp, true);
           
        //文件下载 ，暂未用
        } else if(msg instanceof Chat.CFileChat) {
			System.out.println("DDHZH"+"收到文件 ");
            Chat.CFileChat ccp = (Chat.CFileChat) msg;
            if (ccp.getFile() != null) {
                String path=ccp.getInitialFileName();
                //把文件存到指定地址  没有进度条（进度条客服端封装）
                //FileHandler.fileHandle(ccp.getFile().newInput(),path);
            }
        //离线消息处理
        } else if(msg instanceof Chat.CListChat) {
			System.out.println("DDHZH"+"离线消息");
            Chat.CListChat chat = (Chat.CListChat) msg;
            List<Chat.CPrivateChat> chats=chat.getChatsList();
            for (int i= chats.size()-1; i>=0; i--) {
            	Chat.CPrivateChat cPrivateChat  = chats.get(i);
            	receiveMsg(cPrivateChat, false); // 离线消息保存 ，安卓
            }
            
//            for (Chat.CPrivateChat cPrivateChat : chats) {
//            	receiveMsg(cPrivateChat);
//            }
        } else if(msg instanceof Chat.CLineChat) {
			System.out.println("DDHZH"+"上下线");
            Chat.CLineChat line = (Chat.CLineChat) msg;
//            if(line.getLineState()==line.getLineState().onLine){
//                System.out.println(line.getUserId() +"上线了");
//            }else{
//                System.out.println(line.getUserId() +"下线了");
//            }
        }

//        //这样设置的原因是，防止两方都阻塞在输入上
//        if (_verify) {
//          //  sendMessage();
//            Thread.sleep(100);
//        }
    }

//    /**
//     * 下载文件测试
//     */
//    void fileDownload() {
//        Chat.CFileChat.Builder fileChat=Chat.CFileChat.newBuilder();
//        //要存的地方和原始文件名
//        fileChat.setInitialFileName("C:\\Users\\33303\\Desktop\\aaa.jpg");
//        //服务器返回的新文件名
//        fileChat.setNewFileName("149773138316.jpg");
//        ByteBuf byteBuf = Utils.pack2Client(fileChat.build());
//        _gateClientConnection.writeAndFlush(byteBuf);
//    }

    /**
     * 发消息
     */
    public static void sendMessage(Chat.CPrivateChat.Builder cp) {

    	// 如果发送语音或者 图片，需要转换文件流
        if (cp.getContentType() == Chat.ContentType.audio || cp.getContentType() == Chat.ContentType.photo) {
        	try {
//        		app = GlobalVariable.getInstance();
                InputStream in = new FileInputStream(new File("服务端的消息" + "/"+ cp.getInitialFileName())); // 文件名由发送时传来
                ByteString bs = ByteString.readFrom(in);
                cp.setFile(bs);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        ByteBuf byteBuf = Utils.pack2Client(cp.build());
        if (_gateClientConnection != null) {
        	//发送消息到服务端 
            _gateClientConnection.writeAndFlush(byteBuf);
        } else {
//        	TipsChat(GlobalConstant.SHOW_SEND_ERR, "");
        }
        
    }
	
    /**
     * 接入收消息后的处理
     * @param ccp
     * @param isNow
     */
	public void receiveMsg(Chat.CPrivateChat ccp, boolean isNow)
	{
//		MsgDBbean bean = new MsgDBbean();
		
		String chartId; //该显示给哪个群ID或者个人用户ID
		String filePath="";
		
		if (ccp.getChatType() == Chat.ChatType.point) {
			chartId = ccp.getSelf();//发送方用户ID
		} else {
			chartId = ccp.getGroupId();// 群ID
		}
		
		if (ccp.getContentType() == Chat.ContentType.audio || ccp.getContentType() == Chat.ContentType.photo) {
			// 语音,图片
			// 保存文件
			ByteString bs = ccp.getFile();
//			FileTcpServer file = new FileTcpServer();
//			try {
//				filePath = file.saveFile(bs, ccp.getInitialFileName()); // 安卓方法，保存文件并返回本地路径+文件
//			} catch (Exception e) {
//				e.printStackTrace();
//			}

		} 
					 //else if (ccp.getContentType() == Chat.ContentType.video) {
//			        	// 文件
//			        	
//			     	}
					

	}


	

	
	

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) {
        //ctx.flush();
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        // Close the connection when an exception is raised.
        cause.printStackTrace();
        ctx.close();
    }



    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        //重连
        if(_close){
            Client.startConnect();
        }

    }
    
    public static void closeChannel() {
    	if (_gateClientConnection != null) {
    		_gateClientConnection.close();

    	}
        _close = false;
    }

}
