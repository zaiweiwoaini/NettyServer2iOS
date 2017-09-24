package com.server.string;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

import io.netty.channel.socket.SocketChannel;
import protobuf.code.PacketDecoder;
import protobuf.code.PacketEncoder;

/**
 * Created by zaiwei on 2017/9/22.
 */
public class HelloServerInitializer extends ChannelInitializer<SocketChannel> {


    @Override
    protected void initChannel(SocketChannel ch) throws Exception {
        // TODO Auto-generated method stub
        //ChannelPipeline 可以理解为消息传送通道 通道一旦建立 持续存在
        ChannelPipeline channelPipeline = ch.pipeline();
        //为通道添加功能
        //字符串解码  编码
        channelPipeline.addLast("decoder",new StringDecoder());
        channelPipeline.addLast("encoder", new StringEncoder());
//        channelPipeline.addLast("MessageDecoder", new PacketDecoder());
//        channelPipeline.addLast("MessageEncoder", new PacketEncoder());
        //添加自主逻辑
        channelPipeline.addLast(new HelloServerHandler());
    }


}

