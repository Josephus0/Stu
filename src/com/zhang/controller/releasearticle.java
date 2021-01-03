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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@WebServlet("/releaseartic")
public class releasearticle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码

        String title = req.getParameter("title");//文章标题
        String atags = req.getParameter("atags1")+"  "+req.getParameter("atags2")+"  "+req.getParameter("atags3");//文章标签

        String aclass = req.getParameter("aclass");//分类专栏
        String afrist = req.getParameter("afrist");//是否原创
        String author = req.getParameter("author");//作者
        String txttextarea = req.getParameter("txttextarea");//文章内容

        String brief = req.getParameter("brief");
        //System.out.println(atags);System.out.println(aclass);System.out.println(afrist);System.out.println(author);System.out.println(txttextarea);

        long aa = System.currentTimeMillis();
        String ran1 = String.valueOf(aa);
        /**
         * 现在需要把上面五个东西存入数据库
         * 1.从session中读取出用户的邮箱（唯一标识）
         * 2.写入数据库
         * 3.跳转界面
         */
        HttpSession session = req.getSession();
        MessageModel messageModel = (MessageModel) session.getAttribute("messageModel");
        User user = (User) messageModel.getObject();

        String email = user.getEmail();

        Date date = new Date();//获取当前的日期

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

        String datastr = df.format(date);//获取String类型的时间

        System.out.println("开始修改");
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        conn = JDBCtool.getconnection();
        try {
            System.out.println("修改中1");
            String sql = "insert into articles(article,title,atags,aclass,afrist,author,Text,authorid,releasedate,brief,recommend)values(?,?,?,?,?,?,?,?,?,?,?)";

            presta = conn.prepareStatement(sql);

            presta.setString(1,ran1);//每一篇文章都有一个唯一特定标识
            presta.setString(2,title);
            presta.setString(3,atags);
            presta.setString(4,aclass);
            presta.setString(5,afrist);
            presta.setString(6,author);
            presta.setString(7,txttextarea);
            presta.setString(8,email);
            presta.setString(9,datastr);
            presta.setString(10,brief);
            presta.setString(11,"0");//默认为非首页推荐文章
            presta.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }

        article arti = new article();
        arti.setHtml(txttextarea);
        arti.setTitle(title);
        arti.setAuthor(author);
        arti.setAtags(atags);
        arti.setArticleid(ran1);
        req.getSession().setAttribute("arti",arti);

        req.getRequestDispatcher("readarticle.jsp").forward(req,resp);
    }
}
