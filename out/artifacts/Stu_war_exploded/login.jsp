<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/12
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="../css/Loginx.css">
    <link rel="shortcut icon" href="../images/Blog.ico" type="image/x-icon" />
</head>
<body>

<div style = "text-align: center;"  >
    <form action="login" method = "post" id = "loginForm">
        <b class="titlex"style = "text-align: center">
            B l o g</b>
        <input type ="text" name = "uname" class="uname" id="uname" placeholder="请输入邮箱" value="${messageModel.object.email}"style="border-radius:10px;"> <br>

        <input type="password" name="upwd" class="upwd" id="upwd" placeholder="请输入密码" value="${messageModel.object.userPwd}"style="border-radius:10px;"> <br>
        <span id="msg" style="font-size: 16px; color:red" class="msg">${messageModel.msg}</span><br>
        <p class="forgetpwd"><a href="forgetpwd.jsp" class="forgetp">忘记密码</a></p>
        <button type="button" id="loginBtn" class="loginBtn">登录</button>
        <p class="regist"><a href="resgist.jsp" class="registp">立即注册</a></p>
    </form>
</div>
</body>

<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
    })
$("#loginBtn").click(function () {
    //获取用户姓名和密码的值
    var uname = $("#uname").val();
    var upwd = $("#upwd").val();
    //如果姓名为空，提示用户（span标签赋值），并且return html()方法来调用span
    if(isEmpty(uname)){
        //alert("用户名不可以为空！");
        $("#msg").html("邮箱不可以为空！");
        return;
    }
    if(isEmpty(upwd)){
       // alert("用户密码不可以为空！");
        $("#msg").html("密码不可以为空！");
        return;
    }
    //如果都不为空，则手动提交表单
    $("#loginForm").submit();
});

/**
 * 判断字符串是否为空
 *  如果为空返回true
 * @param str
 * @returns {boolean}
 */
function isEmpty(str) {
    if(str == null || str.trim()== ""){
        return true;
    }
    return false;
}
</script>
</html>
