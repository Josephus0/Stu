package com.zhang.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeletearticleDao {

    //删除文章
    public static void doDelete(String str) {
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        try {
            conn = JDBCtool.getconnection();
            //搜索作者 标题 简介 内容 标签
            String sql = "delete from articles where article=?";
            presta = conn.prepareStatement(sql);
            presta.setString(1,str);
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta,conn,res);
        }
    }

    //删除用户
    public static void doDeleteuser(String str) {
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        try {
            conn = JDBCtool.getconnection();
            //搜索作者 标题 简介 内容 标签
            String sql = "delete from tb_user where email=?";
            presta = conn.prepareStatement(sql);
            presta.setString(1,str);
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta,conn,res);
        }
    }


    public static void updateuser(String email,String password){
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        try {
            conn = JDBCtool.getconnection();
            String sql = "UPDATE  tb_user SET  userPwd=? WHERE email=?";
            presta = conn.prepareStatement(sql);
            presta.setString(1,password);
            presta.setString(2,email);
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta,conn,res);
        }
    }
}
