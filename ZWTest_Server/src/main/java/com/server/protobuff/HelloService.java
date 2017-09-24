package com.server.protobuff;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;

/**
 * Created by zaiwei on 2017/9/22.
 */
public class HelloService {
    /*
 * 创建服务端监听端口
 */

    private static final int portNumber = 8080;
    public static void main(String[] args) throws InterruptedException {
        EventLoopGroup boosGroup = new NioEventLoopGroup();
        EventLoopGroup workerGroup = new NioEventLoopGroup();

        try {
            ServerBootstrap bootstrap = new ServerBootstrap();
            bootstrap.group(boosGroup, workerGroup);
            bootstrap.channel(NioServerSocketChannel.class);
            bootstrap.childHandler(new HelloServerInitializer())
                    .childOption(ChannelOption.SO_KEEPALIVE, true); // (6);

            //服务器绑定端口监听
            ChannelFuture channelFuture = bootstrap.bind(portNumber).sync();
            //监听服务器关闭监听
            channelFuture.channel().closeFuture().sync();
        }finally{
            boosGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        }

    }


}
