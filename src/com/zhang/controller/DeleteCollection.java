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

@WebServlet("/DeleteCollect")
public class DeleteCollection extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String articleid = req.getParameter("articleid");
        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = (User) messageModel.getObject();
        String email = user.getEmail();

        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res= null;
        try {
            conn = JDBCtool.getconnection();
            String sql = "delete from collectionarticle where collecter=? and article=?";
            presta = conn.prepareStatement(sql);
            presta.setString(1,email);
            presta.setString(2,articleid);
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
