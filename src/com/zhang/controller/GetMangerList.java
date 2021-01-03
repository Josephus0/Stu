package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.entity.article;
import com.zhang.mapper.MangerDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/GetMangerList")
public class GetMangerList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码
        //一个用户表 两个文章表
        ArrayList<User> userlist= MangerDao.GetUserlist();
        ArrayList<article> articlelist=MangerDao.Getarticlelist();
        ArrayList<article> recommendlist=MangerDao.Getrecommendlist();

        req.getSession().setAttribute("userlist",userlist);
        req.getSession().setAttribute("articlelist",articlelist);
        req.getSession().setAttribute("recommendlist",recommendlist);
    }
}
