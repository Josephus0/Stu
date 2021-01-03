package com.zhang.mapper;

import com.zhang.entity.User;
import com.zhang.entity.article;
import com.zhang.entity.vo.MessageModel;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoSearch {

    public static ArrayList<article> GetSearchReslist(String str){
        ArrayList<article> Searchlist=new ArrayList<>();


        Connection conn = null;
        ResultSet res = null;
        PreparedStatement presta = null;

        try {
            //articleid title introduction afrist date
            conn = JDBCtool.getconnection();
            //搜索作者 标题 简介 内容 标签
            String sql="select * from articles where authorid like ? or title like ? or brief like ?  or Text like ? or atags like ? ";
            presta = conn.prepareStatement(sql);
            presta.setString(1, "%"+str+"%");presta.setString(2, "%"+str+"%");
            presta.setString(3, "%"+str+"%");presta.setString(4, "%"+str+"%");
            presta.setString(5, "%"+str+"%");
            res=presta.executeQuery();
            while(res.next()) {
                article b=new article();

                b.setTitle(res.getString("title"));//标题 简介 id 是否原创 日期
                b.setAuthor(res.getString("author"));
                b.setIntroduction(res.getString("brief"));
                b.setArticleid(res.getString("article"));
                b.setAfrist(res.getString("afrist"));
                b.setDate(res.getString("releasedate"));
                Searchlist.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }
        return Searchlist;
    }
}
