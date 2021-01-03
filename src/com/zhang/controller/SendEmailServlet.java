package com.zhang.controller;

import com.zhang.entity.vo.ForgetpwdModel;
import com.zhang.mapper.JDBCtool;
import com.zhang.util.SendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

/**
 * 找回密码的验证码发送Sevrlet
 */
@WebServlet("/Sendemailf")
public class SendEmailServlet extends HttpServlet {

//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        ForgetpwdModel Msgyzm1= new ForgetpwdModel();
//        String email = req.getParameter("emailx"); //用户输入的邮箱
//        System.out.println("电子邮箱为："+email);
//        Msgyzm1.setEmail(email);
//        try {
//            boolean flag = false;
//            Connection conn = null;
//            PreparedStatement presta  = null;//要执行SQL语句首先要Statement对象
//            ResultSet res  = null;
//            try {
//                //获取连接
//                conn= JDBCtool.getconnection();
//                String sql="select * from tb_user where email = ? ";
//                presta= conn.prepareStatement(sql);
//                //给？赋值
//                presta.setString(1,email);//参数是？的位置+？的内
//                res = presta.executeQuery();
//                //判断用户对象是否为空
//                if(!res.next()){
//                    flag=true;
//                    System.out.println("用户不存在！");
//                    Msgyzm1.setMsg("用户不存在！");
//                }else flag=false;
//
//            } catch (SQLException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }finally {
//                JDBCtool.close(presta, conn, res);
//            }
//            if(flag){
//                req.setAttribute("Msgyzm1",Msgyzm1);
//                req.getRequestDispatcher("forgetpwd.jsp").forward(req,resp);
//            }else{
//                //将找回密码验证码存入Cookie中
//                Cookie UserEmail = new Cookie("UserEmail", email);
//                UserEmail.setMaxAge(10*60); //设置cookie最大存活时间10分钟
//                resp.addCookie(UserEmail);
//
//                System.out.println("电子邮箱为："+email);
//
//
//                SendMail sendMail = new SendMail(email);
//                sendMail.setTitle("Boke验证码");
//
//                String code = getCode();
//                sendMail.setContent("验证码为：" + code + ",十分钟内输入有效。若非本人操作，请忽略");
//                sendMail.sendMessage();
//                //将找回密码验证码存入Cookie中
//                Cookie emailCode = new Cookie("PasswordEmailCode", code);
//                emailCode.setMaxAge(10*60); //设置cookie最大存活时间10分钟
//                resp.addCookie(emailCode);
//                System.out.println("验证码发送成功");
//                req.setAttribute("Msgyzm1",Msgyzm1);
//                req.getRequestDispatcher("forgetpwd.jsp").forward(req,resp);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入后端");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String email = req.getParameter("address"); //用户输入的邮箱
        System.out.println("电子邮箱为："+email);
        try {
            boolean flag = false;
            Connection conn = null;
            PreparedStatement presta  = null;//要执行SQL语句首先要Statement对象
            ResultSet res  = null;
            try {
                //获取连接
                conn= JDBCtool.getconnection();
                String sql="select * from tb_user where email = ? ";
                presta= conn.prepareStatement(sql);
                //给？赋值
                presta.setString(1,email);//参数是？的位置+？的内
                res = presta.executeQuery();
                //判断用户对象是否为空
                if(!res.next()){
                    flag=true;
                    System.out.println("用户不存在！");
                    resp.getWriter().write("用户不存在！");
                    return ;
                }else flag=false;

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }finally {
                JDBCtool.close(presta, conn, res);
            }
            if(flag==false){
                //将找回密码验证码存入Cookie中
                Cookie UserEmail = new Cookie("UserEmail", email);
                UserEmail.setMaxAge(10*60); //设置cookie最大存活时间10分钟
                resp.addCookie(UserEmail);

                System.out.println("电子邮箱为："+email);


                SendMail sendMail = new SendMail(email);
                sendMail.setTitle("Boke验证码");

                String code = getCode();
                sendMail.setContent("验证码为：" + code + ",十分钟内输入有效。若非本人操作，请忽略");
                sendMail.sendMessage();
                //将找回密码验证码存入Cookie中
                Cookie emailCode = new Cookie("PasswordEmailCode", code);
                emailCode.setMaxAge(10*60); //设置cookie最大存活时间10分钟
                resp.addCookie(emailCode);
                System.out.println("验证码发送成功");

                resp.getWriter().write("请进入邮箱查看验证码");
            }
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
