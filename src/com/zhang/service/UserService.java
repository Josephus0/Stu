package com.zhang.service;

import com.zhang.entity.User;
import com.zhang.entity.vo.MessageModel;
import com.zhang.mapper.JDBCtool;
import com.zhang.util.StringUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 业务逻辑
 */
public class UserService {

    /**
     * 用户登录
     * 参数的非空判断，后台一定要判断，可能前台没有判断非空
     *
     * @param uname
     * @param upwd
     * @return
     */
    public MessageModel userLogin(String uname ,String upwd){

        MessageModel messageModel =  new MessageModel();

        //回显数据
        User u = new User();
        u.setEmail(uname);
        u.setUserPwd(upwd);
        messageModel.setObject(u);

        //参数的非空判断
        if(StringUtil.isEmpty(uname)|| StringUtil.isEmpty(upwd)){
            //将状态码、提示信息、回显数据设置到消息模型中
            messageModel.setCode(0);
            messageModel.setMsg("用户名和密码不能为空");
            //回显数据
            return messageModel;
        }
        //调用dao层的查询方法,通过用户名查询用户对象
        User user = new User();
        user.setEmail(uname);

        Connection conn = null;
        PreparedStatement presta  = null;//要执行SQL语句首先要Statement对象
        ResultSet res  = null;
        try {
            //获取连接
            conn= JDBCtool.getconnection();
            String sql="select * from tb_user where email = ? ";
            presta= conn.prepareStatement(sql);
            //给？赋值
			presta.setString(1,uname);//参数是？的位置+？的内
            res = presta.executeQuery();
            //判断用户对象是否为空
            if(!res.next()){
                messageModel.setCode(0);
                System.out.println("用户不存在！");
                messageModel.setMsg("用户不存在！");
                return messageModel;
            }
            //判断数据库中查询到的用户密码与前台传递过来的面做比较

            user.setUserAge(res.getString("userAge"));
            user.setUserPwd(res.getString("userPwd"));
            user.setNickName(res.getString("nickName"));
            user.setUserName(res.getString("userName"));
            user.setGender(res.getString("gender"));
            user.setBirthday(res.getString("birthday"));
            user.setPhonenumber(res.getString("phonenumber"));
            user.setIntroduction(res.getString("introduction"));
            user.setHeadsrc(res.getString("headsrc"));
            if(!upwd.equals(user.getUserPwd())){
                messageModel.setCode(0);
                System.out.println("用户密码不正确!");
                messageModel.setMsg("用户密码不正确！");
                return messageModel;
            }
            if("1".equals(res.getString("manger"))){
                messageModel.setCode(2);
                System.out.println("管理员登录!");
                messageModel.setMsg("管理员登录！");
                return messageModel;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCtool.close(presta, conn, res);
        }
         //登录成功,将用户消息设置到消息模型中
        messageModel.setObject(user);
        System.out.println("登录验证的结果为："+messageModel.getCode());
        return messageModel;
    }
}
