package com.zhang.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RecommdDao {

    public static void torecommdart(String str){

        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        try {
            conn = JDBCtool.getconnection();
            //搜索作者 标题 简介 内容 标签
            String sql = "UPDATE  articles SET  recommend=? WHERE article=?;";
            presta = conn.prepareStatement(sql);
            presta.setString(1,"1");
            presta.setString(2,str);
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta,conn,res);
        }
    }

    public static void cancelrecommd(String str){
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        try {
            conn = JDBCtool.getconnection();
            //搜索作者 标题 简介 内容 标签
            String sql = "UPDATE  articles SET  recommend=? WHERE article=?;";
            presta = conn.prepareStatement(sql);
            presta.setString(1,"0");
            presta.setString(2,str);
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta,conn,res);
        }
    }
}
