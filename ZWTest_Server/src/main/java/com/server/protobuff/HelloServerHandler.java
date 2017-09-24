package com.server.protobuff;

/**
 * Created by zaiwei on 2017/9/22.
 */
import com.google.protobuf.Message;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

import java.util.Scanner;

public class HelloServerHandler extends SimpleChannelInboundHandler<Message> {


    @Override
    public void channelActive(ChannelHandlerContext ctx)  {
        //没做验证  密码没用
        String passwd = "123";
    }

    @Override
    protected void channelRead0(ChannelHandlerContext arg0, Message arg1)
    {

        //TODO 首先进 protobuf.code.PacketDecoder 进行解码.

        // TODO Auto-generated method stub
        System.out.println(arg0.channel().remoteAddress()+"   ----channelRead0");
        //收到消息直接打印
        System.out.println(arg0.channel().remoteAddress()+"   MSG:  "+ arg1);
//        //回复消息

        System.out.println(arg0.channel().remoteAddress()+"  msgString:  ");

        arg0.writeAndFlush("  msgString:  "+arg1);
    }
    void sendCLogin(ChannelHandlerContext ctx, String userid, String passwd) {
        System.out.println(userid);
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) {

        System.out.println("");
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
        System.out.println(ctx);

    }

}
