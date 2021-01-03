package com.zhang.controller;

import com.zhang.mapper.CommentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
@WebServlet("/commentform")
public class commentsevrlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //文章id 用户名 用户邮箱 用户头像 评论内容 评论日期
        String articleid = req.getParameter("articleid");
        String username = req.getParameter("articleauthor");
        String useremail= req.getParameter("useremail");
        String userheadsrc = req.getParameter("userheadsrc");
        String editorContent= req.getParameter("editorContent");

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String nowdate = simpleDateFormat.format(date);

        System.out.println(articleid+"\n"+username+"\n"+useremail+"\n"+userheadsrc+"\n"+editorContent+"\n"+nowdate);
        //用户邮箱 用户名 用户头像 文章id   评论内容 评论日期
        CommentDao.addcomment(useremail,username,userheadsrc,articleid,editorContent,nowdate);
    }
}
