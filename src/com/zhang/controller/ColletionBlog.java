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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 获取收藏的博客列表
 * 先根据用户名查询文章id
 * 然后在查询文章内容
 */
@WebServlet("/GetCollectionBokeList")
public class ColletionBlog extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        ResultSet res = null;
        PreparedStatement presta = null;
        ArrayList<article> collectionblog=new ArrayList<>();
        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = (User) messageModel.getObject();
        String email = user.getEmail();
        try {
            conn = JDBCtool.getconnection();
            String sql="select * from collectionarticle where collecter = ?";
            presta = conn.prepareStatement(sql);
            presta.setString(1, email);
            res=presta.executeQuery();

            while(res.next()) {
                article b=new article();
                b.setTitle(res.getString("articletitle"));//标题   id  日期
                b.setArticleid(res.getString("article"));
                b.setDate(res.getString("collecttime"));
                collectionblog.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println("后端博客列表查询成功");
        req.getSession().setAttribute("collectionblog",collectionblog);
    }
}
