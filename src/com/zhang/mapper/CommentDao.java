package com.zhang.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentDao {

    public static void addcomment(String useremail,String username,String headsrc,String articleid,String content,String contentdata){
        //用户邮箱 用户名 用户头像 文章id   评论内容 评论日期
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res= null;

        conn = JDBCtool.getconnection();
        try {
            String sql = "insert into  comments(useremail,username,headsrc,articleid,content,contentdata)values(?,?,?,?,?,?)";
            presta = conn.prepareStatement(sql);
            presta.setString(1,useremail);presta.setString(2,username);
            presta.setString(3,headsrc);presta.setString(4,articleid);
            presta.setString(5,content);presta.setString(6,contentdata);
            presta.executeUpdate();
            System.out.println("评论写入数据库");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta,conn,res);
        }


    }

}
