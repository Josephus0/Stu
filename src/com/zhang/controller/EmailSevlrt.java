package com.zhang.controller;

import com.zhang.util.SendMail;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

@WebServlet("/emailf")
public class EmailSevlrt extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        send(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        this.doGet(req, resp);
    }

    private void send(HttpServletRequest req, HttpServletResponse resp) {
        //发送验证码
        try {
            String uemail = req.getParameter("address");
            SendMail sendMail = new SendMail(uemail);
            sendMail.setTitle("Boke验证码");

            String code = getCode();
            sendMail.setContent("验证码为：" + code + ",十分钟内输入有效。若非本人操作，请忽略");
            sendMail.sendMessage();
            //将验证码存入Cookie中
            Cookie emailCode = new Cookie("EmailCode", code);
            emailCode.setMaxAge(10*60); //设置cookie最大存活时间10分钟
            resp.addCookie(emailCode);
            System.out.println("验证码发送成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //随机生成4位数验证码
    private static String getCode() {
        int code = new Random().nextInt(9000) + 1000;
        return code + "";
    }
}
