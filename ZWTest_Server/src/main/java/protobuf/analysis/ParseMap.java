package protobuf.analysis;

import java.io.IOException;

import protobuf.generate.cli2srv.chat.Chat;
import protobuf.generate.cli2srv.login.Auth;
import protobuf.generate.internal.Internal;

import com.google.protobuf.Message;

/**
 * Created by Qzy on 2016/1/29.
 */
public class ParseMap {


    public static Message getMessage(int ptoNum, byte[] bytes) throws IOException {
        //        ParseMap.register(900, Internal.GTransfer::parseFrom, Internal.GTransfer.class); //内部传输协议用
//        ParseMap.register(901, Internal.Greet::parseFrom, Internal.Greet.class); //内部传输协议用
//
//        ParseMap.register(1000, Auth.CLogin::parseFrom, Auth.CLogin.class);
//        ParseMap.register(1001, Auth.SResponse::parseFrom, Auth.SResponse.class);
//        ParseMap.register(1002, Chat.CPrivateChat::parseFrom, Chat.CPrivateChat.class);
//        ParseMap.register(1003, Chat.CFileChat::parseFrom, Chat.CFileChat.class);
//        ParseMap.register(1004, Chat.CListChat::parseFrom, Chat.CListChat.class);
//        ParseMap.register(1005, Chat.CLineChat::parseFrom, Chat.CLineChat.class);

        Message msg =null;
        if(ptoNum==900){
            msg= Internal.GTransfer.parseFrom(bytes);
        }else if(ptoNum==901){
            msg=Internal.Greet.parseFrom(bytes);
        }else if(ptoNum==1000){
            msg= Auth.CLogin.parseFrom(bytes);
        }else if(ptoNum==1001){
            msg=Auth.SResponse.parseFrom(bytes);
        }else if(ptoNum==1002){
            msg= Chat.CPrivateChat.parseFrom(bytes);
        }else if(ptoNum==1003){
            msg=Chat.CFileChat.parseFrom(bytes);
        }else if(ptoNum==1004){
            msg=Chat.CListChat.parseFrom(bytes);
        }else if(ptoNum==1005){
            msg=Chat.CLineChat.parseFrom(bytes);
        }

        return msg;
    }

    public static Integer getPtoNum(Message msg) {
        return getPtoNum(msg.getClass());
    }

    public static Integer getPtoNum(Class<?> clz) {
        if(clz.equals(Internal.GTransfer.class)){
           return 900;
        }else if(clz.equals(Internal.Greet.class)){
            return 901;
        }else if(clz.equals(Auth.CLogin.class)){
            return 1000;
        }else if(clz.equals(Auth.SResponse.class)){
            return 1001;
        }else if(clz.equals(Chat.CPrivateChat.class)){
            return 1002;
        }else if(clz.equals(Chat.CFileChat.class)){
            return 1003;
        }else if(clz.equals(Chat.CListChat.class)){
            return 1004;
        }else if(clz.equals(Chat.CLineChat.class)){
            return 1005;
        }

        return null;
    }

}
