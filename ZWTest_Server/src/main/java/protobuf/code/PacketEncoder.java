package protobuf.code;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;
import protobuf.analysis.ParseMap;

import com.google.protobuf.Message;

/**
 * Created by Administrator on 2016/1/29.
 */
public class PacketEncoder extends MessageToByteEncoder<Message> {

    @Override
    protected void encode(ChannelHandlerContext ctx, Message msg, ByteBuf out)
            throws Exception {

        byte[] bytes = msg.toByteArray();// 将对象转换为byte
        int ptoNum = ParseMap.getPtoNum(msg);
        int length = bytes.length;

        /* 加密消息体
        ThreeDES des = ctx.channel().attr(ClientAttr.ENCRYPT).get();
        byte[] encryptByte = des.encrypt(bytes);
        int length = encryptByte.length;*/

        ByteBuf buf = Unpooled.buffer(8 + length);
        buf.writeInt(length);
        buf.writeInt(ptoNum);
        buf.writeBytes(bytes);
        out.writeBytes(buf);


    }
}
