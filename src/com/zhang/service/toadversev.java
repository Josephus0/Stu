package com.zhang.service;

import com.zhang.controller.HeadPic;
import com.zhang.mapper.advertiseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toadvertisaax")
public class toadversev extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码
        String ad1 = req.getParameter("ad1");
        String ad2 = req.getParameter("ad2");
        String ad3 = req.getParameter("ad3");
        String ad4 = req.getParameter("ad4");
        String ad5 = req.getParameter("ad5");

        advertiseDao.cunad(ad1,ad2,ad3,ad4,ad5);

        req.getSession().setAttribute("ad1",ad1);
        req.getSession().setAttribute("ad2",ad2);
        req.getSession().setAttribute("ad3",ad3);
        req.getSession().setAttribute("ad4",ad4);
        req.getSession().setAttribute("ad5",ad5);
        
    }
}
