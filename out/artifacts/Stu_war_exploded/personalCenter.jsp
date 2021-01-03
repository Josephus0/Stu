<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/25
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <script type="text/javascript" src="../js/headpic.js"></script>
    <link rel="stylesheet" tyep="text/css" href="../css/headpic.css">
    <link rel="stylesheet" type="text/css" href="../css/personalCenter.css">
</head>
<body>
<div class="top" style="position: absolute; z-index: 10">
        <ul>
            <li style="color:#00b2ff;"><a href="#" class="person"><b>个人资料</b></a></li>
            <li><a href="AccountSetting.jsp" class="account">账号设置</a></li>
            <li><a href="C" class="changepassword">修改密码</a></li>
        </ul>
</div>
<div class="top2" style="position: absolute; z-index: 10">
    <div class="topto" id="topto" style="width:200px" align="center">
        <img class="toima" src="${messageModel.object.headsrc}" id="preview" >
    </div>
    <div class="MessageList">
    <p class="p1">昵    称:    ${messageModel.object.nickName}</p>
    <p class="p2">邮    箱:    ${messageModel.object.email}</p>
        <hr style="background: #2633f9;height: 1px;border: none;">
    <p class="p3">姓    名:    ${messageModel.object.userName}</p>
    <p class="p4">年    龄:    ${messageModel.object.userAge}</p>
    <p class="p5">性    别:    ${messageModel.object.gender}</p>
        <hr style="background: #2633f9;height: 1px;border: none;">
    <p class="p6">生    日:    ${messageModel.object.birthday}</p>
    <p class="p7">联系方式:    ${messageModel.object.phonenumber}</p>
    <p class="p8">简    介:    ${messageModel.object.introduction}</p>
    </div>
</div>
<div class="frist">
    <img class="backpic" src="../images/back.jpg">
</div>

</body>
</html>
