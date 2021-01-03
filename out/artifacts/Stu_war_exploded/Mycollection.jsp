<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/10/5
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的收藏</title>
    <link type="text/css" rel="stylesheet" href="../css/mycollection.css">
    <script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
    <script>
        window.onload = function () {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型，传递方式
                dataType: "json",//预期服务器返回的数据类型
                url: "/GetCollectionBokeList",//url，就是form里面的action，不要忘了url前面加/
            });
        }
    </script>
</head>
<body>
<div style=" z-index: 10;">
    <div class="alldiv">
        <div class="leftbtn">
            <ul>
                <li><a  href="MyBlog.jsp">博客管理</a></li>
                <li><a href="Blogclass.jsp">分类专栏</a></li>
                <li><a href="">订阅专栏</a></li>
                <li><a style="background-color: #2c99b0; " href="Mycollection.jsp">我的收藏</a></li>
                <li><a href="">我的关注</a></li>
                <li><a href="">我的笔记</a></li>
                <li><a href="">我的问答</a></li>
                <li><a href="">我的论坛</a></li>
            </ul>
        </div>
        <div class="bloglistdiv">
            <ul>
                <c:forEach items="${collectionblog}" var="item">
                    <br>
                    <div class="blist">
                        <li>
                            <a onclick="" href="read.jsp?articleid=${item.articleid}" target="_blank"
                               style="text-decoration: none;">
                                <h2>${item.title}</h2>
                                <p style='color:#010491;font-size: 12px;'>收藏时间 ${item.date}</p>
                            </a>
                            <button onclick="canclecollection('${item.articleid}')">取消收藏</button>
                        </li>
                        <hr>
                    </div>
                </c:forEach>
            </ul>
            <br><br><br>
        </div>

    </div>
</div>
<div class="frist" style=" z-index: -1">
    <img class="backpic" src="../images/MyBlogBack.jpg">
</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script type="text/javascript">
    function canclecollection(str) {
        if(confirm('确定要取消收藏吗？'))
        {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型，传递方式
                dataType: "json",//预期服务器返回的数据类型
                url: "/DeleteCollect" ,//url，就是form里面的action，不要忘了url前面加/
                data: {articleid:str},//form的id
            });
            location.reload();
            return;
        }

    }
</script>
</html>
