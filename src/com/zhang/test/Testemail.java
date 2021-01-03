package com.zhang.test;

import com.zhang.util.SendMail;

import java.util.Random;

public class Testemail {

    public static void main(String[] args) throws Exception {

        String address = "z1635552844@163.com";
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
