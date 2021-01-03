package com.zhang.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class advertiseDao {

    public static void cunad(String ad1,String ad2,String ad3,String ad4,String ad5){
        Connection conn = null;
        PreparedStatement presta = null;
        ResultSet res = null;
        conn = JDBCtool.getconnection();
        try {
            String sql = "UPDATE  adervtis SET  ad1=?,ad2=?,ad3=?,ad4=?,ad5=? WHERE tag=?";
            presta = conn.prepareStatement(sql);
            presta.setString(1, ad1);
            presta.setString(2,ad2);
            presta.setString(3,ad3);
            presta.setString(4,ad4);
            presta.setString(5,ad5);
            presta.setString(6,"'ad'");
            presta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }
    }


}
