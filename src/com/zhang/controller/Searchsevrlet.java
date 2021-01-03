package com.zhang.controller;

import com.zhang.entity.article;
import com.zhang.mapper.DaoSearch;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/tosearchBlog")
public class Searchsevrlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //articleid title introduction afrist date
        String str = req.getParameter("searchinput");

        System.out.println("搜索内容："+str);
        ArrayList<article> Searchlist=DaoSearch.GetSearchReslist(str);

        req.getSession().setAttribute("Searchlist",Searchlist);
    }
}
