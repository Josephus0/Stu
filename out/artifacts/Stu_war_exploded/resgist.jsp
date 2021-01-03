<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/14
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <link rel="shortcut icon" href="images/Blog.jpg">
    <link rel="stylesheet" type="text/css" href="../css/regist.css">
    <script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
</head>
<body>
<div class="wrapper">
    <article>
        <h1 class="Tip"><span>博客 Blog</span></h1>
        <div class="main">

            <form action="resgist" method = "post" id = "resgistForm">
                <div class="nickName">
                    <input type="text" name="nickName" id="nickName" placeholder="昵称" value="${messageModel12.object.nickName}">
                </div>
                <div class="userAge">
                    <input type="text" name="userAge" id="userAge" placeholder="年龄" value="${messageModel12.object.userAge}">
                </div>
                <div class="password">
                    <input type="password" name="upwd" id="upwd" placeholder="密码" value="${messageModel12.object.userPwd}">
                </div>
                <div class="againpwd">
                    <input type="password" name="upwd" id="upwd1" placeholder="再次输入密码" value="${messageModel12.object.userPwd}"><!--<em>两次密码不一致</em>-->
                </div>

                <div class="tel">
                    <input type="tel" name="uemail" id="uemail" placeholder="邮箱" value="${messageModel12.object.email}">
                </div>

                <span id="msg1" style="font-size: 12px; color:red">${messageModel12.msg}</span>
                <div class="tel">
                    <button type="button" id="yzmBtn">获取验证码</button>
                </div>
                <div class="yzm">
                    <input type="text" name="yzm" id="yzm" placeholder="验证码">
                </div>
                <span id="msg2" style="font-size: 12px; color:red">${messageModel2.msg}</span>
                <button type="button" id="">注册</button>
            </form>
        </div>
    </article>

</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>

<script type="text/javascript">

    $("#yzmBtn").click(function (){

        //获取邮箱
        var uemail = $("#uemail").val();
        //获取用户昵称密码
        var nickName = $("#nickName").val();
        var upwd = $("#upwd").val();
        var upwd1 = $("#upwd1").val();
        var userAge = $("#userAge").val();
        if(isEmpty(nickName)){
            $("#msg1").html("昵称不可以为空！");
            return;
        }else{$("#msg1").html(" ");}
        if(isEmpty(userAge)){
            $("#msg1").html("邮箱不可以为空！");
            return;
        }else{$("#msg1").html(" ");}
        if(isEmpty(upwd)){
            $("#msg1").html("密码不可以为空！");
            return;
        }else{$("#msg1").html(" ");}
        if(isEmpty(upwd1)){
            $("#msg1").html("请再次输入密码！");
            return;
        }else{$("#msg1").html(" ");}
        if(upwd===upwd1){
            $("#msg1").html(" ");
        }else{
            $("#msg1").html("两次密码不一致！");
            return;
        }
        if(checkEmail(uemail))
        {
            $("#msg1").html("请输入格式正确的e-mail地址");
            return;
        }else{$("#msg1").html(" ");}

        sendMCode();
        $("#msg1").html("验证码发送成功");

    });
    function sendMCode() {

        var request = ajaxFunction(); //创建xmlHttpRequest对象
        var address = $('#uemail').val(); //用户输入的邮箱地址
        var myButton = $("#yzmBtn"); //获取验证码按钮

        myButton.attr("disabled", true); //使按钮失效
        myButton.css("background-color", "#8a8a8a"); //改变按钮颜色

        //按钮失效倒计时
        var count = 60;
        countTimes();
        function countTimes() {
            myButton.html("重新发送(" + count + "s)");
            count--;
            if (count > 0) {
                setTimeout(countTimes, 1000);
            } else if (count === 0) {
                myButton.html("重新发送");
                myButton.attr("disabled", false); //重新激活按钮
                myButton.css("background-color", "#164BFF");
            }
        }

        //发送请求，参数分别为：发送方式   发送地址   是否异步传输
        request.open("GET", "emailf?address=" + address, true);
        request.send();
    }

    //创建xmlHttpRequest对象
    function ajaxFunction() {
        var xmlHttp;
        try {
            xmlHttp = new XMLHttpRequest();
        } catch (e) {
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }
        return xmlHttp;
    }
    //点击注册按钮校验验证码
    $("#registBtn").click(function () {
        $("#msg1").html(" ");
        //如果都不为空，则手动提交表单
        //提交注册表单
        $("#resgistForm").submit();
    });
    //验证邮箱是否合法
    function checkEmail(str) {
        var pattern = /^([a-z0-9]+[\.\-_]?)*[a-z0-9]+@[a-z0-9]+[-_]?[a-z0-9]+(\.[a-z0-9]{2,3}){1,2}$/ig;
        if(pattern.test(str))
        {
            if(str.indexOf("www.",0)==0){
               // alert('电子邮件地址非法');
                return true;
            }else{
                //alert('电子邮件地址合法');
                return false;
            }
        } else {
            //alert('电子邮件地址非法');
            return true;
        }
    }
    function isEmpty(str) {
        if(str == null || str.trim()== ""){
            return true;
        }
        return false;
    }
</script>
</html>
