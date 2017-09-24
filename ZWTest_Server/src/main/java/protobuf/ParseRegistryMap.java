package protobuf;

import java.io.IOException;

/**
 * Created by Qzy on 2016/1/30.
 */
public class ParseRegistryMap {
    public static final int GTRANSFER = 900;
    public static final int GREET = 901;
    public static final int CLOGIN = 1000;

    public static final int CREGISTER = 1001;
    public static final int SRESPONSE = 1002;
    public static final int CPRIVATECHAT = 1003;
    public static final int SPRIVATECHAT = 1004;


    public static void initRegistry() throws IOException {
//        ParseMap.register(900, Internal.GTransfer::parseFrom, Internal.GTransfer.class); //内部传输协议用
//        ParseMap.register(901, Internal.Greet::parseFrom, Internal.Greet.class); //内部传输协议用
//
//        ParseMap.register(1000, Auth.CLogin::parseFrom, Auth.CLogin.class);
//        ParseMap.register(1001, Auth.SResponse::parseFrom, Auth.SResponse.class);
//        ParseMap.register(1002, Chat.CPrivateChat::parseFrom, Chat.CPrivateChat.class);
//        ParseMap.register(1003, Chat.CFileChat::parseFrom, Chat.CFileChat.class);
//        ParseMap.register(1004, Chat.CListChat::parseFrom, Chat.CListChat.class);
//        ParseMap.register(1005, Chat.CLineChat::parseFrom, Chat.CLineChat.class);
    }
}
