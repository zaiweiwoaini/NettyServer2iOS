package com.client;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;

import java.util.concurrent.TimeUnit;

import protobuf.ParseRegistryMap;
import protobuf.code.PacketDecoder;
import protobuf.code.PacketEncoder;

/**
 * Created by Dell on 2016/2/15.
 * Simple client for module test
 */
public class Client {
    static final String HOST = "localhost";//61.164.53.62
    static final int PORT = 8989;//9090
    static final int SIZE = Integer.parseInt(System.getProperty("size", "256"));


//    public static void main(String[] args) throws Exception {
//        startConnect();
//    }

    /**
     * 开启  关闭客服端待实现
     * @throws InterruptedException
     */
    public static void startConnect() throws InterruptedException {
        EventLoopGroup group = new NioEventLoopGroup();
        try{
            Bootstrap b = new Bootstrap();
            b.group(group)
                    .channel(NioSocketChannel.class)
                    .option(ChannelOption.TCP_NODELAY, true)
                    .handler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        public void initChannel(SocketChannel ch) throws Exception {
                            ChannelPipeline p = ch.pipeline();

                            p.addLast("MessageDecoder", new PacketDecoder());
                            p.addLast("MessageEncoder", new PacketEncoder());
                            p.addLast(new ClientHandler());
                        }
                    });

            // Start the client.
            ChannelFuture f = b.connect(HOST, PORT)
                    .addListener(new ChannelFutureListener() {
                @Override
                public void operationComplete(ChannelFuture future)
                        throws Exception {
                    if (future.isSuccess()) {
                        System.out.println("即时通讯后台链接成功");
                        //init registry
                        ParseRegistryMap.initRegistry();
                    } else {

                        System.out.println("即时通讯后台链接失败");
                        try {
                            TimeUnit.SECONDS.sleep(5); //TODO:
                            //从新连接
                            startConnect();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            });

            // Wait until the connection is closed.
            f.channel().closeFuture().sync();
        } finally {
            group.shutdownGracefully();
        }

    }
}

