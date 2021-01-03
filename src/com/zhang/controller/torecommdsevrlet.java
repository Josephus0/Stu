package com.zhang.controller;

import com.zhang.mapper.RecommdDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/torecommdsev")
public class torecommdsevrlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String articleid = req.getParameter("articleid");
        System.out.println(articleid);
        RecommdDao.torecommdart(articleid);

    }
}
