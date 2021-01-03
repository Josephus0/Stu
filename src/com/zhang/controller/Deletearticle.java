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

@WebServlet("/Deletearticle")
public class Deletearticle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String articleid = req.getParameter("articleid");
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        System.out.println("开始删除了");
        try {
            conn = JDBCtool.getconnection();
            String sql = "delete from articles where article=?";
            presta = conn.prepareStatement(sql);
            presta.setString(1, articleid);
            presta.executeUpdate();
            System.out.println("删除成功");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }
        req.getRequestDispatcher("MyBlog.jsp").forward(req,resp);
    }
}
