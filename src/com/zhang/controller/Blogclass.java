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

@WebServlet("/GetBlogclass")
public class Blogclass extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码
        ArrayList<article> coder=new ArrayList<>();
        ArrayList<article> algorithm=new ArrayList<>();
        ArrayList<article> note=new ArrayList<>();
        ArrayList<article> Javanote=new ArrayList<>();
        ArrayList<article> frontnote=new ArrayList<>();

        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = (User) messageModel.getObject();
        String email = user.getEmail();

        Connection conn = null;
        ResultSet res = null;
        PreparedStatement presta = null;
        try {
            conn = JDBCtool.getconnection();
            String sql="select * from articles where authorid = ?";
            presta = conn.prepareStatement(sql);
            presta.setString(1, email);
            res=presta.executeQuery();

            while(res.next()) {
                article b=new article();

                b.setTitle(res.getString("title"));//标题 作者 简介 id 是否原创 日期
                b.setAuthor(res.getString("author"));
                b.setIntroduction(res.getString("brief"));
                b.setArticleid(res.getString("article"));
                b.setAfrist(res.getString("afrist"));
                b.setDate(res.getString("releasedate"));
                b.setAclass(res.getString("aclass"));

                String artclass  = b.getAclass();
                //程序人生 算法 学习笔记 Java  前端
                //coder  algorithm note Javanote frontnote
                if("程序人生".equals(artclass)){
                    coder.add(b);
                }else if("算法".equals(artclass)){
                    algorithm.add(b);
                }else if("学习笔记".equals(artclass)){
                    note.add(b);
                }else if("Java".equals(artclass)){
                    Javanote.add(b);
                }else if("前端".equals(artclass)){
                    frontnote.add(b);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //coder   algorithm note Javanote frontnote
        req.getSession().setAttribute("coder",coder);
        req.getSession().setAttribute("algorithm",algorithm);
        req.getSession().setAttribute("note",note);
        req.getSession().setAttribute("Javanote",Javanote);
        req.getSession().setAttribute("frontnote",frontnote);
    }
}
