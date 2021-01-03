package com.zhang.controller;

import com.zhang.mapper.DeletearticleDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Updateuser")
public class Updateusermessage  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String email = req.getParameter("email");
         String password = req.getParameter("password");
         //System.out.println(email+"  "+password);
         DeletearticleDao.updateuser(email,password);
    }
}
