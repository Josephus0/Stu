package com.zhang.controller;


import com.zhang.entity.User;
import com.zhang.entity.vo.MessageModel;
import com.zhang.mapper.JDBCtool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/ConnectionBlog")
public class Collection extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String articeid  = req.getParameter("articleid");
        String articetitle = req.getParameter("articletitle");
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String nowdate = simpleDateFormat.format(date);
        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = (User) messageModel.getObject();
        String email = user.getEmail();
    System.out.println("文章id"+articeid);
        Connection conn = null;
        PreparedStatement prasta = null;
        ResultSet res= null;
        try {
            conn = JDBCtool.getconnection();
            String sql = "insert into collectionarticle (article,collecter,collecttime,articletitle)values(?,?,?,?)";
            prasta = conn.prepareStatement(sql);

            prasta.setString(1,articeid);
            prasta.setString(2,email);
            prasta.setString(3,nowdate);
            prasta.setString(4,articetitle);
            prasta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(prasta, conn, res);
        }

    }
}
