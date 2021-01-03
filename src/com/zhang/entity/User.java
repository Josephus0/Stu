package com.zhang.entity;

/**
 * User实体类
 */
public class User {
    private Integer userId;//用户编号



    private String nickName;//用户昵称
    private String userPwd;//用户密码
    private String userAge;//用户年龄
    private String email;
    private String userName;
    private String gender;
    private String birthday;
    private String phonenumber;
    private String introduction;
    private String headsrc;//头像路径
    public User(){}
    public User(String nickName,String userAge,String email,String userName,String gender,String birthday,String phonenumber,String introduction){
        this.nickName=nickName;this.userAge=userAge;
        this.email=email;this.userName=userName;
        this.gender=gender;this.birthday=birthday;
        this.phonenumber=phonenumber;this.introduction=introduction;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }




    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserAge() {
        return userAge;
    }

    public void setUserAge(String userAge) {
        this.userAge = userAge;
    }
    public String getHeadsrc() {return headsrc;}
    public void setHeadsrc(String headsrc) { this.headsrc = headsrc; }
}
