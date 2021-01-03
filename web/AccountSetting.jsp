<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/9/25
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号设置</title>
    <script type="text/javascript" src="../js/headpic.js"></script>
    <link rel="stylesheet" tyep="text/css" href="../css/headpic.css">
    <link rel="stylesheet" type="text/css" href="../css/AccountSetting.css">
</head>
<body>

<div class="accounttopsetting" style="position: absolute; z-index: 9">
    <div class="accounttopsetting1">
    <form class="" id="accountform" method="get" action="accountform">
    <p class="p1"><span >昵    称  <input type ="text" name = "nickName" class="nickName" id="nickName"  value="${messageModel.object.nickName}"style="border-radius:10px;"></span></p>
    <p class="p2">邮    箱  <input type ="text" name = "email" class="email" id="email"  readonly="true"  value="${messageModel.object.email}"style="border-radius:10px;"></p>
    <p class="p3">姓    名  <input type ="text" name = "userName" class="userName" id="userName"  value="${messageModel.object.userName}"style="border-radius:10px;"></p>
    <p class="p4">年    龄  <input type ="text" name = "userAge" class="userAge" id="userAge"  value="${messageModel.object.userAge}"style="border-radius:10px;"></p>
    <p class="p5">性    别 <select name= "gender" class="gender" id="gender"  value="${messageModel.object.gender}"style="border-radius:10px;">
        <option value="男">男</option>
        <option value="女">女</option>
    </select> </p>

    <p class="p6">生    日  <input type ="date" name = "birthday" class="birthday" id="birthday"  value="${messageModel.object.birthday}"style="border-radius:10px;"></p>
    <p class="p7">联系方式  <input type ="text" name = "phonenumber" class="phonenumber" id="phonenumber"  value="${messageModel.object.phonenumber}"style="border-radius:10px;"></p>
    <p class="p8">简    介  <input type ="text" name = "introduction" class="introduction" id="introduction"  value="${messageModel.object.introduction}"style="border-radius:10px;"></p>
    </form>
    <span id="msg" style="font-size: 16px; color:red" class="msg"></span><br>
    <button type="button" id="Confirm" class="Confirm">保存</button>
    </div>
    <div class="topto" id="topto" style="width:200px" align="center" style=" z-index: 10">
        <img class="toima" src="${messageModel.object.headsrc}" id="preview" >
        <input class="toBtn" type="file" name="toBtn" id="toBtn" onchange="imgPreview(this)" >
        <button type="button" id="Confirmpic" class="Confirmpic" onclick="upload()">保存</button>
    </div>
</div>

<div class="back">
<img class="accounttopsettingbackpic" src="../images/colorback.jpg">
</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>

<script type="text/javascript">

    $("#Confirm").click(function () {

        var email = $("#email").val();var  nickName= $("#nickName").val();var  userName= $("#userName").val();
        var  userAge= $("#userAge").val();var  gender= $("#gender").val();var birthday = $("#birthday").val();
        var  phonenumber= $("#phonenumber").val();var  introduction= $("#introduction").val();

        if(isEmpty(nickName)){
            $("#msg").html("昵称不可以为空！");
            return;
        }else $("#msg").html("");
        if(isEmpty(email)){
            $("#msg").html("邮箱不可以为空！");
            return;
        }else if(checkEmail(email)){
            $("#msg").html("邮箱不合法！");
            return;
        }else $("#msg").html("");

        if(isEmpty(userName)){
            $("#msg").html("姓名不可以为空！");
            return;
        }else $("#msg").html("");
        if(isEmpty(userAge)){
            $("#msg").html("年龄不可以为空！");
            return;
        }else $("#msg").html("");
        if(isNumber(userAge)){
            $("#msg").html("年龄不合法！");
            return;
        }else $("#msg").html("");
        if(isEmpty(gender)){
            $("#msg").html("性别不可以为空！");
            return;
        }else $("#msg").html("");
        if(isEmpty(birthday)){
            $("#msg").html("生日不可以为空！");
            return;
        }else $("#msg").html("");
        if(isEmpty(phonenumber)){
            $("#msg").html("电话号码不可以为空！");
            return;
        }else $("#msg").html("");
        if(isEmpty(introduction)){
            $("#msg").html("简介不可以为空！");
            return;
        }else $("#msg").html("");

        <!--$("#accountform").submit();-->
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型，传递方式
            dataType: "json",//预期服务器返回的数据类型
            url: "accountform" ,//url，就是form里面的action
            data: $('#accountform').serialize(),//form的id
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.resultCode == 200) {
                    alert("修改成功");//提交成功
                };
            },
            error : function() {
                alert("修改成功");
               //alert("异常！");//提交成功
            }
        });
    });
    function isEmpty(str) {
        if(str == null || str.trim()== ""){
            return true;
        }
        return false;
    }
    //验证邮箱是否合法
    function checkEmail(str) {
        var pattern = /^([a-z0-9]+[\.\-_]?)*[a-z0-9]+@[a-z0-9]+[-_]?[a-z0-9]+(\.[a-z0-9]{2,3}){1,2}$/ig;
        if(pattern.test(str)) {
            if(str.indexOf("www.",0)==0){
                return false;
            }else{
                return false;
            }
        } else {
            return true;
        }
    }
    function isNumber(val){
        var reg=/^(?:[1-9][0-9]?|1[01][0-9]|120)$/; //非负浮点数
        if(reg.test(val)){
            return false;
        }else{
            return true;
        }
    }
   function upload() {

       if($(toBtn).val()=="") {
               alert("请选择头像");
               return;}

        var request = ajaxFunction(); //创建xmlHttpRequest对象
        var image=document.getElementById("toBtn").files[0];
        var data = new FormData();
        data.append("image",image);
        //发送请求，参数分别为：发送方式   发送地址   是否异步传输
        request.open("post", "headpicservlet" , false);
        request.send(data);

        var responseText = request.responseText;
        console.log(responseText);

        alert("头像修改成功");
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

</script>
</html>
