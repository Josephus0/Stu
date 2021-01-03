<%@ page import="com.zhang.entity.vo.MessageModel" %><%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/24
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../css/indexx.css">
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
</head>
<body>
<div class="top" style="position: absolute; z-index: 10">

    <nav class="nav" id="nav">
        <ul>
            <li style="list-style-type:none;border-bottom:2px solid #00d2ff;padding-bottom: 2px;z-index:-1; " ><a style="color: #00d1ff;" href="index.jsp">首页</a></li>
            <li ><a  href="boke.jsp">博客</a></li>
            <li><a href="#" target="_blank">笔记</a></li>
            <li><a href="" target="_blank">问答社区</a></li>
            <li><a href="Mark.jsp" target="_blank">创作中心</a></li>
            <li>
                <a href="#"><span >${messageModel.object.nickName}</span></a>
                <ul>
                    <li><a href="MyBlog.jsp" target="_blank">我的博客</a></li>
                    <li><a href="personalCenter.jsp" target="_blank"  >个人中心</a></li>
                    <li><a href="AccountSetting.jsp" target="_blank">账号设置</a></li>
                    <li><a href="Mycollection.jsp" target="_blank">我的收藏</a></li>
                    <li><a href=""  target="_blank">我的关注</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<div class="frist">
    <img class="backpic" src="../images/back.jpg">
    <span class="spanx1" style="color: rgb(255,253,253);">O x y g e n</span>
    <span class="spanx2" style="color: rgb(255,253,253);">莫 听 穿 林 打 叶 声，何 妨 吟 啸 且 徐 行</span>
    <button class="Enter">E n t e r</button>
</div>
</body>
</html>
