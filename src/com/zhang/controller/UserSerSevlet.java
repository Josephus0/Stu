package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.entity.article;
import com.zhang.entity.vo.MessageModel;
import com.zhang.mapper.JDBCtool;
import com.zhang.mapper.MangerDao;
import com.zhang.service.UserService;

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

@WebServlet("/login")
public class UserSerSevlet extends HttpServlet {

    //实例化UserService对象
    private UserService userService= new UserService();

    /**
     * 用户登录
     * @param resquest
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest resquest, HttpServletResponse response) throws ServletException, IOException {

        //System.out.println("进入后端");
        resquest.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8"); //设置编码格式，避免中文乱码
        //获取前台的账号和密码
        String uname = resquest.getParameter("uname");
        String upwd = resquest.getParameter("upwd");

        System.out.println("用户名："+uname);
        System.out.println("密码："+upwd);
        MessageModel messageModel = userService.userLogin(uname,upwd);
        Connection conn = null;
        ResultSet res = null;
        PreparedStatement presta = null;
        if(messageModel.getCode()==1){
            //成功
            resquest.getSession().setAttribute("messageModel",messageModel);
            ArrayList<article> blog=new ArrayList<>();
            String email = uname;


            ArrayList<article> collectionblog=new ArrayList<>();

            ArrayList<article> coder=new ArrayList<>();
            ArrayList<article> algorithm=new ArrayList<>();
            ArrayList<article> note=new ArrayList<>();
            ArrayList<article> Javanote=new ArrayList<>();
            ArrayList<article> frontnote=new ArrayList<>();
            try {
                conn = JDBCtool.getconnection();
                String sql="select * from articles where authorid = ?";
                presta = conn.prepareStatement(sql);
                presta.setString(1, email);
                res=presta.executeQuery();
                //res.next();
                //查询文章列表存入list 然后list存入session
                //同时查询分类专栏的list
                while(res.next()) {
                    article b=new article();

                    b.setTitle(res.getString("title"));//标题 简介 id 是否原创 日期
                    b.setAuthor(res.getString("author"));
                    b.setIntroduction(res.getString("brief"));
                    b.setArticleid(res.getString("article"));
                    b.setAfrist(res.getString("afrist"));
                    b.setDate(res.getString("releasedate"));
                    blog.add(b);

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


                String sql2="select * from collectionarticle where collecter = ?";
                presta = conn.prepareStatement(sql2);
                presta.setString(1, email);
                res=presta.executeQuery();
                //res.next();
                while(res.next()) {
                    article b=new article();
                    b.setTitle(res.getString("articletitle"));//标题   id  日期
                    b.setArticleid(res.getString("article"));
                    b.setDate(res.getString("collecttime"));
                    collectionblog.add(b);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                JDBCtool.close(presta, conn, res);
            }
            //分类专栏的list存入session
            resquest.getSession().setAttribute("coder",coder);
            resquest.getSession().setAttribute("algorithm",algorithm);
            resquest.getSession().setAttribute("note",note);
            resquest.getSession().setAttribute("Javanote",Javanote);
            resquest.getSession().setAttribute("frontnote",frontnote);
            //博客列表list和收藏列表存入session
            resquest.getSession().setAttribute("collectionblog",collectionblog);
            resquest.getSession().setAttribute("blog",blog);
            try {
                //查询广告
                conn = JDBCtool.getconnection();
                String sql="select * from adervtis where tag = ?";
                presta = conn.prepareStatement(sql);
                presta.setString(1, "ad");
                res=presta.executeQuery();
                res.next();
                resquest.getSession().setAttribute("ad1",res.getString("ad1"));
                resquest.getSession().setAttribute("ad2",res.getString("ad2"));
                resquest.getSession().setAttribute("ad3",res.getString("ad3"));
                resquest.getSession().setAttribute("ad4",res.getString("ad4"));
                resquest.getSession().setAttribute("ad5",res.getString("ad5"));
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                JDBCtool.close(presta,conn,res);
            }
            ArrayList<article> recommendlist=MangerDao.Getrecommendlist();
            resquest.getSession().setAttribute("recommendlist",recommendlist);
            resquest.getRequestDispatcher("homepage.jsp").forward(resquest,response);

        }else if(messageModel.getCode()==2){

            //管理员登录
            //调用Dao包的类，查询 用户列表 文章列表 首页推荐文章列表
            //然后分别存入session
            //打开管理员界面 三个表格界面
            //一个用户表 两个文章表
            ArrayList<User> userlist= MangerDao.GetUserlist();
            ArrayList<article> articlelist=MangerDao.Getarticlelist();
            ArrayList<article> recommendlist=MangerDao.Getrecommendlist();

            resquest.getSession().setAttribute("userlist",userlist);
            resquest.getSession().setAttribute("articlelist",articlelist);
            resquest.getSession().setAttribute("recommendlist",recommendlist);



            try {
                //查询广告
                conn = JDBCtool.getconnection();
                String sql="select * from adervtis where tag = ?";
                presta = conn.prepareStatement(sql);
                presta.setString(1, "ad");
                res=presta.executeQuery();
                res.next();
                resquest.getSession().setAttribute("ad1",res.getString("ad1"));
                resquest.getSession().setAttribute("ad2",res.getString("ad2"));
                resquest.getSession().setAttribute("ad3",res.getString("ad3"));
                resquest.getSession().setAttribute("ad4",res.getString("ad4"));
                resquest.getSession().setAttribute("ad5",res.getString("ad5"));
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                JDBCtool.close(presta,conn,res);
            }



            //最后跳转到管理员界面 ok
            resquest.getRequestDispatcher("MangerPage.jsp").forward(resquest,response);
        }else{
            resquest.setAttribute("messageModel",messageModel);
            resquest.getRequestDispatcher("login.jsp").forward(resquest,response);
        }
    }
}
