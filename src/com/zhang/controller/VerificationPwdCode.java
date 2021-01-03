package com.zhang.controller;

import com.zhang.entity.vo.ForgetpwdModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 验证验证码是否正确的servlet
 */
@WebServlet("/yzemailf")
public class VerificationPwdCode extends HttpServlet {

    //PasswordEmailCode
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //System.out.println("进入后端");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String yzm = req.getParameter("yzm"); //用户输入的验证码

        System.out.println("验证码1："+yzm);
        String emailCode = null; //从Cookie中取出验证码

        Cookie[] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if ("PasswordEmailCode".equals(cookie.getName())) {
                emailCode = cookie.getValue();
                break;
            }
        }
        System.out.println("验证码："+emailCode);
        ForgetpwdModel Msgyzm1 = new ForgetpwdModel();
        Msgyzm1.setEmail(req.getParameter("emailx"));
        //Cookie中的验证码不是空，然后再qeuals验证码是否正确
        if (emailCode != null && emailCode.equals(yzm)){
            //验证码正确，跳转界面
            System.out.println("验证码正确");

            resp.getWriter().write("1");
        }else{
            System.out.println("验证码错误");
            resp.getWriter().write("验证码错误！");
        }
    }


}
