package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.entity.vo.MessageModel;
import com.zhang.mapper.ResgistDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/resgist")
public class UserResgistSevlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //System.out.println("开始注册");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码
        String msgCode = req.getParameter("yzm"); //用户输入的验证码
        String emailCode = null; //从Cookie中取出验证码

        Cookie[] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if ("EmailCode".equals(cookie.getName())) {
                emailCode = cookie.getValue();
                break;
            }
        }

        MessageModel messageModel12 = new MessageModel();
        if (emailCode != null && emailCode.equals(msgCode)) {
            User user = new User();
            user.setUserPwd(req.getParameter("upwd"));
            user.setNickName(req.getParameter("nickName"));
            user.setUserAge(req.getParameter("userAge"));
            user.setEmail(req.getParameter("uemail"));
            ResgistDao resgistDao = new ResgistDao();
            messageModel12  = resgistDao.ResDao(user);
            if (messageModel12.getCode()==1) {
                //注册成功，跳转至登录界面
                resp.sendRedirect("login.jsp");
                System.out.println("注册成功");
            } else {
                System.out.println("注册失败，邮箱已被占用！");
                messageModel12.setMsg("注册失败，邮箱已被占用！");
                req.setAttribute("messageModel12", messageModel12);
                req.getRequestDispatcher("resgist.jsp").forward(req,resp);
            }
        } else {
            //System.out.println("验证码为"+emailCode+msgCode);
            System.out.println("验证码错误");
            messageModel12.setMsg("验证码错误");
            req.setAttribute("messageModel12",messageModel12);
            req.getRequestDispatcher("resgist.jsp").forward(req,resp);
        }
    }
}
