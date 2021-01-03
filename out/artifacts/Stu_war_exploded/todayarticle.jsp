<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/29
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>推荐</title>
    <link rel="stylesheet" type="text/css" href="../css/indexx.css">
    <link rel="stylesheet" type="text/css" href="../css/bokepage.css">
    <link rel="stylesheet" type="text/css" href="../css/pic.css">
</head>
<body>
<div class="left" style=" z-index: 10">
    <ul>　　
        <li><a style="background-color: #2c99b0; " href="boke.jsp" target="_blank">首页</a></li>
        <li><a  herf="">推荐</a></li>
        <li><a herf="">程序人生</a></li>
        <li><a herf="">Java</a></li>
        <li><a herf="">Python</a></li>
        <li><a herf="">前端</a></li>
        <li><a herf="">算法</a></li>
        <li><a herf="">架构</a></li>
        <li><a herf="">区块链</a></li>
        <li><a herf="">数据库</a></li>
        <li><a herf="">5G</a></li>
        <li><a herf="">游戏开发</a></li>
        <li><a herf="">移动开发</a></li>
        <li><a herf="">运维</a></li>
        <li><a herf="">安全</a></li>
        <li><a herf="">云计算</a></li>
        <li><a herf="">大数据</a></li>
        <li><a herf="">研发管理</a></li>
        <li><a herf="">物联网</a></li>
        <li><a herf="">AI</a></li>
    </ul>
</div>
<div class="">

</div>
<div class="Bigdiv">
    <div class="top" style=" z-index: 10">
        <nav class="nav" id="nav">
            <ul>
                <li><a href="../homepage.jsp">首页</a></li>
                <li style="list-style-type:none;border-bottom:2px solid #00d2ff;padding-bottom: 2px;z-index:-1; "><a
                        style="color: #00d1ff;" href="#">博客</a></li>
                <li><a href="#">笔记</a></li>
                <li><a href="#">问答社区</a></li>
                <li><a href="Mark.jsp">创作中心</a></li>
                <li>
                    <a href="#"><span>${messageModel.object.nickName}</span></a>
                    <ul>
                        <li><a href="MyBlog.jsp">我的博客</a></li>
                        <li><a href="personalCenter.jsp" target="_blank">个人中心</a></li>
                        <li><a href="AccountSetting.jsp" target="_blank">账号设置</a></li>
                        <li><a href="" target="_blank">我的收藏</a></li>
                        <li><a href="Mycollection.jsp" target="_blank">我的关注</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>

    <div class="tuijian" >
        <h3>今日推荐</h3>
        <ul>
            <c:forEach items="${recommendlist}" var="item">
                <br>
                <div class="blist">
                    <li>
                        <a onclick="" href="JsutreadPage.jsp?articleid=${item.articleid}" target="_blank"
                           style="text-decoration: none;">
                            <h2>${item.title}</h2>
                            <p style='color:#090909;font-size: 16px;'>${item.introduction}</p>
                            <p style='color:#010491;font-size: 12px;'>${item.afrist} ${item.date}</p>
                        </a>
                    </li>
                    <hr>
                </div>
            </c:forEach></ul>
        <br><br><br>
    </div>
</div>
<div class="frist" style=" z-index: -1">
    <img class="backpic" src="../images/back.jpg">
</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="../js/pic.js"></script>
<script>
    function tosearch() {

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型，传递方式
            dataType: "json",//预期服务器返回的数据类型
            url: "/tosearchBlog" ,//url，就是form里面的action，不要忘了url前面加/
            data: $('#searchform').serialize(),//form的id
        });

        var myButton = $("#searchbtn"); //获取搜索按钮
        myButton.attr("disabled", true); //使按钮失效
        myButton.css("background-color", "#8a8a8a"); //改变按钮颜色
        //按钮失效倒计时
        var count = 2;
        countTimes();
        function countTimes() {
            myButton.html("正在查询");
            count--;
            if (count > 0) {
                setTimeout(countTimes, 1000);
            } else if (count === 0) {
                myButton.html("搜索");
                myButton.attr("disabled", false); //重新激活按钮
                myButton.css("background-color", "#2c99b0");
                location.reload();
            }
        }

    }
</script>
</html>
