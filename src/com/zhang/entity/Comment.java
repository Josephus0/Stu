package com.zhang.entity;

/**
 * 文章评论的实体类
 */
public class Comment {

    private String useremail;//用户邮箱
    private String username ;//用户姓名
    private String articleid  ;//文章id
    private String headsrc  ;//用户头像
    private String content  ;//评论内容
    private String contentdata  ;//评论日期

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getArticleid() {
        return articleid;
    }

    public void setArticleid(String articleid) {
        this.articleid = articleid;
    }

    public String getHeadsrc() {
        return headsrc;
    }

    public void setHeadsrc(String headsrc) {
        this.headsrc = headsrc;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContentdata() {
        return contentdata;
    }

    public void setContentdata(String contentdata) {
        this.contentdata = contentdata;
    }
}
