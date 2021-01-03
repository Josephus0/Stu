package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.entity.vo.MessageModel;
import com.zhang.mapper.ImageUpload;
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

@WebServlet("/headpicservlet")
public class HeadPic extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //System.out.println("开始修改头像了");
        String picpath = ImageUpload.upLoadImg(req);
        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = (User)messageModel.getObject();
        user.setHeadsrc(picpath);

        String email = user.getEmail();
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        conn = JDBCtool.getconnection();
        try {
            System.out.println("修改中1");
            String sql = "UPDATE  tb_user SET  headsrc=? WHERE email=?;";
            presta = conn.prepareStatement(sql);
            System.out.println("修改中2");
            presta.setString(1, picpath);
            presta.setString(2,email);
            presta.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }
        messageModel.setObject(user);
        req.getSession().setAttribute("messageModel",messageModel);
        System.out.println("修改成功");
    }
}
