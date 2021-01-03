<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/10/8
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>后台管理</title>
    <link rel="shortcut icon" href="../images/Blog.ico" type="image/x-icon" />
    <link type="text/css" rel="stylesheet" href="../css/MangerPage.css">
    <script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
    <script>
        window.onload = function () {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型，传递方式
                dataType: "json",//预期服务器返回的数据类型
                url: "/GetMangerList",//url，就是form里面的action，不要忘了url前面加/
            });
        }
    </script>
</head>
<body>
<div class="bigdiv" style=" z-index: 10">

    <div class="leftNavigation">
        <ul class="leftul">
            <li><a class="userul" onclick="fun1()" style="background-color: #2c99b0;" >用户列表</a></li>
            <li><a class="articleul"  onclick="fun2()" >文章列表</a></li>
            <li><a class="recommendul" onclick="fun3()" >首页推荐</a></li>
            <li><a class="adul" onclick="fun4()" >首页广告</a></li>
        </ul>
    </div>

    <div class="userdiv">
        <table border="3">
            <tr>
                <td>昵 称</td><td>邮 箱</td><td>密 码</td><td>年 龄</td><td>姓 名</td><td>性 别</td><td>联 系 方 式</td>
            </tr>
            <c:forEach items="${userlist}" var="item">
                <tr class="truser" id="truser" name="truser">
                <td>${item.nickName}</td><td>${item.email}</td><td>${item.userPwd}</td><td>${item.userAge}</td><td>${item.userName}</td> <td>${item.gender}</td>
                <td>${item.phonenumber}</td>
                <td><button onclick="editorusermessage('${item.nickName}','${item.email}','${item.userPwd}')">编辑</button></td><td>
                <td><button class="deletuserbtn" onclick="fundeleteuser('${item.email}',this)">删除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="articlediv" style="display: none;">
        <table border="3">
            <tr>
                <td>标 题</td><td>作 者</td><td>作者 id</td><td>类 别</td><td>分 类 专 栏</td>
            </tr>
            <c:forEach items="${articlelist}" var="item">
                <tr class="trart" id="trart" name="trart">
                    <td>${item.title}</td><td>${item.author}</td><td>${item.authorid}</td><td>${item.afrist}</td><td>${item.aclass}</td>
                    <td><a onclick="" href="Justread.jsp?articleid=${item.articleid}" target="_blank" style="text-decoration: none;">查看</a></td>
                    <td><button class="deletartbtn" onclick="deletart('\${item.articleid}',this)">删除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="recommenddiv" style="display: none;">
        <table border="3">
            <tr>
                <td>标 题</td><td>作 者</td><td>作者 id</td><td>类 别</td><td>分 类 专 栏</td>
            </tr>
            <c:forEach items="${recommendlist}" var="item">
                <tr>
                    <td>${item.title}</td><td>${item.author}</td><td>${item.authorid}</td><td>${item.afrist}</td><td>${item.aclass}</td>
                    <td><button class="concelrecommend" onclick="funconcelrecommend('${item.articleid}',this)">取消推荐</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="editordiv" id="editordiv" style="display: none;  z-index: 10">
        <h2>编辑个人信息</h2>
        昵称：<input class="nikenameipt" id="nikenameipt" readOnly="true"><br>
        邮箱：<input class="emailipt" id="emailipt" readOnly="true"><br>
        密码：<input class="passwordipt" id="passwordipt"><br>
        <button onclick="conceldiv()">取消</button><button onclick="toinserdatebase()">确定</button>
    </div>

    <div class="advertisementdiv" id="advertisementdiv" style="display: none;  z-index: 10">
        <h2>首页广告文案</h2>
        <form class="advertisementform" id="advertisementform"></form>
        <ul>
            <li><input form="advertisementform" value="${ad1}" class="ad1" name="ad1" id="ad1" style="width: 700px;height: 30px"><button onclick="toadvertisaax()" style="width: 100px;height: 30px">保存</button></li><hr>
            <li><input form="advertisementform"value="${ad2}" class="ad2" name="ad2" id="ad2" style="width: 700px;height: 30px"><button onclick="toadvertisaax()" style="width: 100px;height: 30px">保存</button></li><hr>
            <li><input form="advertisementform"value="${ad3}" class="ad3" name="ad3" id="ad3" style="width: 700px;height: 30px"><button onclick="toadvertisaax()" style="width: 100px;height: 30px">保存</button></li><hr>
            <li><input form="advertisementform"value="${ad4}" class="ad4" name="ad4" id="ad4" style="width: 700px;height: 30px"><button onclick="toadvertisaax()" style="width: 100px;height: 30px">保存</button></li><hr>
            <li><input form="advertisementform" value="${ad5}" class="ad5" name="ad5" id="ad5" style="width: 700px;height: 30px"><button onclick="toadvertisaax()" style="width: 100px;height: 30px">保存</button></li><hr>
        </ul>
    </div>

</div>
<div class="frist" style=" z-index: -1">
    <img class="backpic" src="../images/MyBlogBack.jpg">
</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script type="text/javascript">

    function funconcelrecommend(str,obj) {
        if(confirm('确定取消推荐该文章吗？'))
        {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型，传递方式
                dataType: "json",//预期服务器返回的数据类型
                url: "/Deleteartsev" ,//url，就是form里面的action，不要忘了url前面加/
                data: {articleid:str},//form的id
            });
            var index = $(obj).parents("tr").index(); //这个可获取当前tr的下标 未使用
            $(obj).parents("tr").remove(); //实现删除tr
        }
    }
    function editorusermessage(str1,str2,str3) {
        document.getElementsByClassName('editordiv')[0].style.display = "block";
        document.getElementById('nikenameipt').value=str1;
        document.getElementById('emailipt').value=str2;
        document.getElementById('passwordipt').value=str3;
    }

    function toinserdatebase() {
        var password = $("#passwordipt").val();
        if(password==""){
            alert("密码不可以为空");
            return ;
        }
        var emailipt = $("#emailipt").val();
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型，传递方式
            dataType: "json",//预期服务器返回的数据类型
            url: "/Updateuser" ,//url，就是form里面的action，不要忘了url前面加/
            data: {email:emailipt,password:password},//form的id
        });
        alert("修改成功");
        document.getElementsByClassName('editordiv')[0].style.display = "none";
    }
    function conceldiv() {
        document.getElementsByClassName('editordiv')[0].style.display = "none";
    }
    //点击左边栏的时候，显示对于栏目，然后隐藏其他栏目
    function fun1() {
        document.getElementsByClassName('userdiv')[0].style.display = "block";document.getElementsByClassName('articlediv')[0].style.display = "none";
        document.getElementsByClassName('recommenddiv')[0].style.display = "none";
        document.getElementsByClassName('advertisementdiv')[0].style.display = "none";

        document.getElementsByClassName('userul')[0].style.backgroundColor = "#2c99b0";document.getElementsByClassName('articleul')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('recommendul')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('adul')[0].style.backgroundColor = "#343434";
    }
    function fun2() {
        document.getElementsByClassName('userdiv')[0].style.display = "none";document.getElementsByClassName('articlediv')[0].style.display = "block";
        document.getElementsByClassName('recommenddiv')[0].style.display = "none";
        document.getElementsByClassName('advertisementdiv')[0].style.display = "none";

        document.getElementsByClassName('userul')[0].style.backgroundColor = "#343434";document.getElementsByClassName('articleul')[0].style.backgroundColor = "#2c99b0";
        document.getElementsByClassName('recommendul')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('adul')[0].style.backgroundColor = "#343434";
    }
    function fun3() {
        document.getElementsByClassName('userdiv')[0].style.display = "none";document.getElementsByClassName('articlediv')[0].style.display = "none";
        document.getElementsByClassName('recommenddiv')[0].style.display = "block";
        document.getElementsByClassName('advertisementdiv')[0].style.display = "none";

        document.getElementsByClassName('userul')[0].style.backgroundColor = "#343434";document.getElementsByClassName('articleul')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('recommendul')[0].style.backgroundColor = "#2c99b0";
        document.getElementsByClassName('adul')[0].style.backgroundColor = "#343434";
    }
    function fun4() {
        document.getElementsByClassName('userdiv')[0].style.display = "none";document.getElementsByClassName('articlediv')[0].style.display = "none";
        document.getElementsByClassName('recommenddiv')[0].style.display = "none";
        document.getElementsByClassName('advertisementdiv')[0].style.display = "block";

        document.getElementsByClassName('userul')[0].style.backgroundColor = "#343434";document.getElementsByClassName('articleul')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('recommendul')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('adul')[0].style.backgroundColor = "#2c99b0";
    }

    function deletart(str,obj) {

        if(confirm('确定删除该文章吗？'))
        {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型，传递方式
                dataType: "json",//预期服务器返回的数据类型
                url: "/Deleteartsev" ,//url，就是form里面的action，不要忘了url前面加/
                data: {articleid:str},//form的id
            });
            var index = $(obj).parents("tr").index(); //这个可获取当前tr的下标 未使用
            $(obj).parents("tr").remove(); //实现删除tr
        }

    }

    function fundeleteuser(str,obj) {

        if(confirm('确定移除该用户吗？'))
        {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型，传递方式
                dataType: "json",//预期服务器返回的数据类型
                url: "/Deleteuserurl" ,//url，就是form里面的action，不要忘了url前面加/
                data: {email:str},//form的id
            });
            var index = $(obj).parents("tr").index(); //这个可获取当前tr的下标 未使用
            $(obj).parents("tr").remove(); //实现删除tr
        }
    }
</script>
</html>
