package com.zhang.util;

import java.util.Random;

public class SendMailUtil {

    //发件箱为1635552844@qq.com
   public static void Send(String address) throws Exception {
        SendMail sendMail = new SendMail(address);
        sendMail.setTitle("Boke验证码");

        sendMail.setContent("验证码为：" + getCode() + ",十分钟内输入有效。若非本人操作，请忽略");
        sendMail.sendMessage();
    }

    //随机生成4位数验证码
    private static String getCode() {
        int code = new Random().nextInt(9000) + 1000;
        return code + "";
    }
}
