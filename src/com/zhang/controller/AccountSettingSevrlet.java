package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.entity.vo.MessageModel;
import com.zhang.mapper.JDBCtool;


import java.io.IOException;import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/accountform")
public class AccountSettingSevrlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码
        String nickName = req.getParameter("nickName");
        String email = req.getParameter("email");
        String  userName= req.getParameter("userName");
        String  userAge= req.getParameter("userAge");
        String  gender= req.getParameter("gender");
        String  birthday= req.getParameter("birthday");
        String  phonenumber= req.getParameter("phonenumber");
        String  introduction= req.getParameter("introduction");

        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = new User(nickName,userAge,email,userName,gender,birthday,phonenumber,introduction);
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        conn = JDBCtool.getconnection();
        try {
            System.out.println("修改中1");
            String sql = "UPDATE  tb_user SET  nickName=?,userAge=?,email=?,userName=?,gender=?,birthday=?,phonenumber=?,introduction=? WHERE email=?;";
            presta = conn.prepareStatement(sql);
            System.out.println("修改中2");
            presta.setString(1, nickName);
            presta.setString(2,userAge);
            presta.setString(3,email);
            presta.setString(4,userName);
            presta.setString(5,gender);
            presta.setString(6,birthday);
            presta.setString(7,phonenumber);
            presta.setString(8,introduction);
            presta.setString(9,email);
            presta.executeUpdate();
            System.out.println("修改成功");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }
        messageModel.setObject(user);
        req.getSession().setAttribute("messageModel",messageModel);
    }

}
