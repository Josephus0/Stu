package com.zhang.controller;

import com.zhang.entity.Comment;
import com.zhang.entity.article;
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
import java.util.ArrayList;

@WebServlet("/toread")
public class toreadsevrlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String articleid = req.getParameter("articleid");

        System.out.println(articleid);

        Connection conn = null;
        ResultSet res = null;
        PreparedStatement presta = null;
        //查询文章+评论
        System.out.println("正在查询");
        ArrayList<Comment> Commentlist=new ArrayList<>();

        try {
            conn = JDBCtool.getconnection();
            String sql="select * from articles where article = ?";
            presta = conn.prepareStatement(sql);
            presta.setString(1, articleid);
            res=presta.executeQuery();
            res.next();
            article artiread = new article();
            artiread.setArticleid(articleid);
            artiread.setHtml(res.getString("Text"));
            artiread.setTitle(res.getString("title"));
            artiread.setAuthor(res.getString("author"));
            artiread.setAtags(res.getString("atags"));
            artiread.setArticleid(res.getString("article"));
            req.getSession().setAttribute("artiread",artiread);

            String sql2="select * from comments where articleid = ?";
            presta = conn.prepareStatement(sql2);
            presta.setString(1, articleid);
            res=presta.executeQuery();
            while(res.next()) {
                Comment comment = new Comment();
                comment.setUseremail(res.getString("useremail"));
                comment.setUsername(res.getString("username"));
                comment.setArticleid(res.getString("articleid"));
                comment.setHeadsrc(res.getString("headsrc"));
                comment.setContent(res.getString("content"));
                comment.setContentdata(res.getString("contentdata"));
                Commentlist.add(comment);
            }
            System.out.println(artiread.getTitle());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getSession().setAttribute("Commentlist",Commentlist);
    }
}
