package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.entity.article;
import com.zhang.entity.vo.MessageModel;
import com.zhang.mapper.JDBCtool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/GetBokeList")
public class BlogList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = null;
        ResultSet res = null;
        PreparedStatement presta = null;
        ArrayList<article> blog=new ArrayList<>();
        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = (User) messageModel.getObject();
        String email = user.getEmail();
        try {
            conn = JDBCtool.getconnection();
            String sql="select * from articles where authorid = ?";
            presta = conn.prepareStatement(sql);
            presta.setString(1, email);
            res=presta.executeQuery();

            while(res.next()) {
                article b=new article();

                b.setTitle(res.getString("title"));//标题 简介 id 是否原创 日期
                b.setAuthor(res.getString("author"));

                b.setIntroduction(res.getString("brief"));
                b.setArticleid(res.getString("article"));
                b.setAfrist(res.getString("afrist"));
                b.setDate(res.getString("releasedate"));
                blog.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }
        //System.out.println("后端博客列表查询成功");
        req.getSession().setAttribute("blog",blog);
    }
}
