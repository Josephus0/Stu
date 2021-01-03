<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/19
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>找回密码</title>
    <link rel="stylesheet" type="text/css" href="../css/forgetPwd.css">
</head>
<body>
<!--把form用div包起来,div的style="display:none" 是隐藏,去掉none就是显示-->
<div style = "text-align: center" class="frist">

    <form class="tip1" id="email" action="yzemailf" method="get">
        <input type ="text" class="emailx" id="emailx" name="emailx" placeholder="请输入邮箱"  >
        <button type="button" class="getNum" id="getNum" name="getNum">获取验证码</button> <br>
        <input type="text" class="yzm"  id="yzm" name="yzm" placeholder="请输入验证码"><br>
        <span class="msg1" style="font-size: 16px; color:red" id = "msg1"></span><br>
        <button type="button" class="yz" id="yz">确    定</button>
    </form>

    <form method="get" class="verpwd" id="verpwd" action="Verpwd"  style='display:none'>
        <input type="password" class="pwd1" id="pwd1" name="pwd1" placeholder="请输入密码"><br>
        <input type="password" class="pwd2" id="pwd2" name="pwd2" placeholder="请再次输入密码"><br>

        <span id="msg" style="font-size: 12px; color:red"></span>
        <button type="button" class="sub" id="sub">确定</button>
    </form>
</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script type="text/javascript">

    $("#sub").click(function () {

        var pwd1 = $("#pwd1").val();
        var pwd2 = $("#pwd2").val();
        if(pwd1===pwd2){
            $("#msg").html(" ");
        }else{
            $("#msg").html("两次密码不一致！");
            return;
        }
        $("#verpwd").submit();
    });
    $("#yz").click(function () {
        var yzm = $("#yzm").val();
        var address = "999";
        if(isEmpty(yzm)){
            $("#msg1").html("验证码为空！");
            return ;
        }else {$("#msg1").html("");}
        var xmlhttp=ajaxFunction();
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                var ans = xmlhttp.responseText;
                if(ans==="1")
                {
                    document.getElementById('email').style.display='none';
                    document.getElementById('verpwd').style.display='block';
                }
                else document.getElementById("msg1").innerHTML=ans;
            }
        }
        xmlhttp.open("Get","yzemailf?yzm="+yzm,true);
        xmlhttp.send();
    });
    $("#getNum").click(function (){
        var address = $("#emailx").val();
        if(isEmpty(address)){
            $("#msg1").html("邮箱不可以为空！");
            return ;
        }else{$("#msg1").html("");}
        if(checkEmail(address)){
            $("#msg1").html("邮箱不合法！");
            return ;
        }else{$("#msg1").html("");}
        var myButton = $("#getNum"); //获取验证码按钮
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
        var xmlhttp=ajaxFunction();
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("msg1").innerHTML=xmlhttp.responseText;
            }
        }

        xmlhttp.open("Get","Sendemailf?address="+address,true);
        xmlhttp.send();
       <!--$("#Justemail").submit();-->
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
    function isEmpty(str) {
        if(str == null || str.trim()== ""){
            return true;
        }
        return false;
    }
</script>
</html>
