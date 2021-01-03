package com.zhang.controller;

import com.zhang.mapper.JDBCtool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/editorartic")
public class editorblogsevrlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码
        String txttextarea = req.getParameter("txttextarea");//文章内容
        String articleid = req.getParameter("articleid");
        String title = req.getParameter("title");//文章标题

        System.out.println();
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        conn = JDBCtool.getconnection();
        System.out.println("开始修改博客");
        try {
            String sql = " UPDATE  articles SET title=?,Text=? WHERE article=?;";
            presta = conn.prepareStatement(sql);
            presta.setString(1,title);
            presta.setString(2,txttextarea);
            presta.setString(3,articleid);
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("博客修改完成");
        req.getRequestDispatcher("read.jsp").forward(req,resp);
    }
}
