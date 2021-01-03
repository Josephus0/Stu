package com.zhang.mapper;

import com.zhang.entity.User;
import com.zhang.entity.article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MangerDao {

    //获取用户列表
    public static  ArrayList<User> GetUserlist(){

        ArrayList<User> userlist=new ArrayList<>();

        Connection conn = null;
        PreparedStatement presta  = null;//要执行SQL语句首先要Statement对象
        ResultSet res  = null;
        try {
            conn  = JDBCtool.getconnection();
            String sql = "select * from tb_user";
            presta= conn.prepareStatement(sql);
            res = presta.executeQuery();
           //<td>昵 称</td><td>邮 箱</td><td>密 码</td><td>年 龄</td><td>姓 名</td><td>性 别</td><td>联 系 方 式</td>
            while(res.next()){
                User user = new User();
                user.setNickName(res.getString("nickName"));
                user.setEmail(res.getString("email"));
                user.setUserPwd(res.getString("userPwd"));
                user.setUserAge(res.getString("userAge"));
                user.setUserName(res.getString("userName"));
                user.setGender(res.getString("gender"));
                user.setPhonenumber(res.getString("phonenumber"));
                userlist.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userlist;
    }

    //获取所有文章列表
    public static  ArrayList<article> Getarticlelist(){

        ArrayList<article> articlelist=new ArrayList<>();
        Connection conn = null;
        PreparedStatement presta  = null;//要执行SQL语句首先要Statement对象
        ResultSet res  = null;
        try {
            conn  = JDBCtool.getconnection();
            String sql = "select * from articles";
            presta= conn.prepareStatement(sql);
            res = presta.executeQuery();
            //<td>标 题</td><td>作 者</td><td>作者 id</td><td>类 别</td><td>分 类 专 栏</td>
            while(res.next()){
                article b=new article();
                b.setTitle(res.getString("title"));//标题 作者 作者id 文章id 类别 分类专栏
                b.setAuthor(res.getString("author"));
                b.setAuthorid(res.getString("authorid"));
               // System.out.println(b.getArticleid());
                b.setAfrist(res.getString("afrist"));
                b.setArticleid(res.getString("article"));
                b.setAclass(res.getString("aclass"));
                articlelist.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articlelist;
    }

    //获取推荐文章列表
    public static  ArrayList<article> Getrecommendlist(){

        //文章id  标题 介绍 原创 日期
        ArrayList<article> recommendlist=new ArrayList<>();

        Connection conn = null;
        PreparedStatement presta  = null;//要执行SQL语句首先要Statement对象
        ResultSet res  = null;
        try {
            conn  = JDBCtool.getconnection();
            String sql = "select * from articles";
            presta= conn.prepareStatement(sql);
            res = presta.executeQuery();
            //<td>标 题</td><td>作 者</td><td>作者 id</td><td>类 别</td><td>分 类 专 栏</td>
            while(res.next()){
                //如果是推荐的文章就加入 //文章id  标题 介绍 原创 日期
                if(res.getString("recommend").equals("1")){
                    article b=new article();
                    b.setTitle(res.getString("title"));//标题 作者 作者id 文章id 类别 分类专栏
                    b.setAuthor(res.getString("author"));
                    b.setAuthorid(res.getString("authorid"));
                     System.out.println("推荐文章233："+b.getArticleid());
                    b.setAfrist(res.getString("afrist"));
                    b.setArticleid(res.getString("article"));
                    b.setAclass(res.getString("aclass"));
                    b.setDate(res.getString("releasedate"));
                    recommendlist.add(b);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recommendlist;
    }
}
