<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/12
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>

    <link rel="stylesheet" type="text/css" href="../css/indexx.css">
    <link rel="shortcut icon" href="../images/Blog.ico" type="image/x-icon" />
    <!--制作的图标，使用href关联，仅仅需要更改href的内容  -->
</head>
<body>
<div class="top" style="position: absolute; z-index: 10">
    <nav class="nav" id="nav">
    <ul>
        <li style="list-style-type:none;border-bottom:2px solid #00d2ff;padding-bottom: 2px;z-index:-1; " ><a style="color: #00d1ff;" href="index.jsp">首页</a></li>
        <li ><a  href="#">博客</a></li>
        <li><a href="#">笔记</a></li>
        <li><a href="#">问答社区</a></li>
        <li><a href="#">创作中心</a></li>
        <li>
            <a href="#">登录/注册</a>
            <ul>
                <li><a href="login.jsp">登录</a></li>
                <li><a href="resgist.jsp">注册</a></li>
            </ul>
        </li>
    </ul>
    </nav>

</div>
<div class="frist">
    <img class="backpic" src="../images/back.jpg">
    <span class="spanx1" style="color: rgb(255,253,253);">O x y g e n</span>
    <span class="spanx2" style="color: rgb(255,253,253);">莫 听 穿 林 打 叶 声，何 妨 吟 啸 且 徐 行</span>
    <button class="Enter">E n t e r</button>
</div>
</body>
</html>
