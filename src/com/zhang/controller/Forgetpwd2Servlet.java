package com.zhang.controller;

import com.zhang.mapper.JDBCtool;

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

@WebServlet("/Verpwd")
public class Forgetpwd2Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String UserEmail = null; //从Cookie中取出邮箱
        Cookie[] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if ("UserEmail".equals(cookie.getName())) {
                UserEmail = cookie.getValue();
                break;
            }
        }
        String pwd = req.getParameter("pwd1");
        Connection conn = null;
        PreparedStatement presta  = null;//要执行SQL语句首先要Statement对象
        ResultSet res  = null;
        try {


            conn = JDBCtool.getconnection();
            String sql="Update tb_user set userPwd=?where email=?";

            presta= conn.prepareStatement(sql);
            //给？赋值
            presta.setString(1,pwd);//参数是？的位置+？的内
            presta.setString(2,UserEmail);
            presta.executeUpdate();
            System.out.println("修改成功");
            resp.sendRedirect("login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }

        //判断用户对象是否为空
    }
}
