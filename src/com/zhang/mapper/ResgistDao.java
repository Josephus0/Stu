package com.zhang.mapper;

import com.zhang.entity.User;
import com.zhang.entity.vo.MessageModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ResgistDao{

    public static MessageModel ResDao(User user) {

        MessageModel messageModel2 = new MessageModel();


        String nickName1 = user.getNickName();
        String userPwd1 = user.getUserPwd();
        String userAge1 = user.getUserAge();
        String email1 = user.getEmail();

        Date date = new Date();//获取当前的日期
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String str = df.format(date);//获取String类型的时间
        Connection conn = null;
        PreparedStatement presta = null;//要执行SQL语句首先要Statement对象
        ResultSet res = null;
        try {
            //获取连接
            conn = JDBCtool.getconnection();
            String sqlx = "select * from tb_user where email = ? ";
            presta = conn.prepareStatement(sqlx);
            //给？赋值
            presta.setString(1, email1);//参数是？的位置+？的内
            res = presta.executeQuery();
            //判断用户对象是否为空
            if (res.next()) {
                messageModel2.setCode(0);
                System.out.println("邮箱已被占用");
                messageModel2.setMsg("邮箱已被占用！");
                return messageModel2;
            }else{

            }
            //把注册消息写入数据库
            String sql = "insert into tb_user(nickName,userPwd,userAge,resTime,email,userName,gender,birthday,phonenumber,introduction,headsrc,manger)values(?,?,?,?,?,?,?,?,?,?,?,?)";

            presta = conn.prepareStatement(sql);
            presta.setString(1, nickName1);
            presta.setString(2, userPwd1);
            presta.setString(3, userAge1);
            presta.setString(4, str);
            presta.setString(5, email1);
            presta.setString(6, "待完善");presta.setString(7, "待完善");presta.setString(8,"0000-00-00" );presta.setString(9,"待完善");presta.setString(10, "待完善");presta.setString(11, "headimage/sky.jpg");
            presta.setString(12, "0");
            presta.executeUpdate();

            messageModel2.setCode(1);
            System.out.println("注册成功");
            messageModel2.setMsg("注册成功！");
            return messageModel2;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCtool.close(presta, conn, res);
        }
        return messageModel2;
    }
}
