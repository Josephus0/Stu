package com.zhang.entity;

public class article {

    private String html;//文章内容
    private String title;//文章标题
    private String author;//作者
    private String authorid;
    private String atags;//文章标签
    private String articleid;//文章id
    private String date;//日期
    private String introduction;//文章简介
    private String aclass;//分类专栏
    private String afrist;
    public String getAuthorid() {
        return authorid;
    }

    public void setAuthorid(String authorid) {
        this.authorid = authorid;
    }
    public String getAclass() {
        return aclass;
    }

    public void setAclass(String aclass) {
        this.aclass = aclass;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAfrist() {
        return afrist;
    }

    public void setAfrist(String afrist) {
        this.afrist = afrist;
    }


    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getArticleid() {
        return articleid;
    }

    public void setArticleid(String articleid) {
        this.articleid = articleid;
    }

    public String getAtags() {
        return atags;
    }

    public void setAtags(String atags) {
        this.atags = atags;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHtml() {
        return html;
    }

    public void setHtml(String html) {
        this.html = html;
    }
}
