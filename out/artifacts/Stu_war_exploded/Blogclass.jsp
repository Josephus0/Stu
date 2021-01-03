<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/10/6
  Time: 19:17
  To change this template use File | Settings | File Templates.
  博客分栏界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>分类专栏</title>
    <link type="text/css" rel="stylesheet" href="../css/Blogclass.css">
    <script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
    <script>
        window.onload = function () {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型，传递方式
                dataType: "json",//预期服务器返回的数据类型
                url: "/GetBlogclass",//url，就是form里面的action，不要忘了url前面加/
            });
        }
    </script>
</head>

<body>


<div style=" z-index: 10;">
    <div class="alldiv">
        <div class="leftbtn">
            <ul class="ul1">
                <li><a href="MyBlog.jsp">博客管理</a></li>
                <li><a style="background-color: #2c99b0;" href="">分类专栏</a></li>
                <li><a href="">订阅专栏</a></li>
                <li><a href="Mycollection.jsp">我的收藏</a></li>
                <li><a href="">我的关注</a></li>
                <li><a href="">我的笔记</a></li>
                <li><a href="">我的问答</a></li>
                <li><a href="">我的论坛</a></li>
            </ul>
            <ul class="ul2">
                <li><a class="acoder" onclick="fun1()" style="background-color: #2c99b0;" >程序人生</a></li>
                <li><a class="aalgorithm"  onclick="fun2()" >算法</a></li>
                <li><a class="anote" onclick="fun3()" >学习笔记</a></li>
                <li><a class="aJavanote" onclick="fun4()" >Java</a></li>
                <li><a class="afrontnote" onclick="fun5()" >前端</a></li>
            </ul>

        </div>

        <div class="coder">
          <ul>
                <c:forEach items="${coder}" var="item">
                    <br>
                    <div class="blist">
                        <li>
                            <a onclick="" href="read.jsp?articleid=${item.articleid}" target="_blank"
                               style="text-decoration: none;">
                                <h2>${item.title}</h2>
                                <p style='color:#090909;font-size: 16px;'>${item.introduction}</p>
                                <p style='color:#010491;font-size: 12px;'>${item.afrist} ${item.date}</p>
                            </a>
                        </li>
                        <hr>
                    </div>
                </c:forEach>
            </ul>
            <br><br><br>
        </div>
        <div class="algorithm" style="display: none;">
               <ul>
                <c:forEach items="${algorithm}" var="item">
                    <br>
                    <div class="blist">
                        <li>
                            <a onclick="" href="read.jsp?articleid=${item.articleid}" target="_blank"
                               style="text-decoration: none;">
                                <h2>${item.title}</h2>
                                <p style='color:#090909;font-size: 16px;'>${item.introduction}</p>
                                <p style='color:#010491;font-size: 12px;'>${item.afrist} ${item.date}</p>
                            </a>
                        </li>
                        <hr>
                    </div>
                </c:forEach>
            </ul>
            <br><br><br>
        </div>
        <div class="note" style="display: none;">
             <ul>
                <c:forEach items="${note}" var="item">
                    <br>
                    <div class="blist">
                        <li>
                            <a onclick="" href="read.jsp?articleid=${item.articleid}" target="_blank"
                               style="text-decoration: none;">
                                <h2>${item.title}</h2>
                                <p style='color:#090909;font-size: 16px;'>${item.introduction}</p>
                                <p style='color:#010491;font-size: 12px;'>${item.afrist} ${item.date}</p>
                            </a>
                        </li>
                        <hr>
                    </div>
                </c:forEach>
            </ul>
            <br><br><br>
        </div>
        <div class="Javanote" style="display: none;">
             <ul>
                <c:forEach items="${Javanote}" var="item">
                    <br>
                    <div class="blist">
                        <li>
                            <a onclick="" href="read.jsp?articleid=${item.articleid}" target="_blank"
                               style="text-decoration: none;">
                                <h2>${item.title}</h2>
                                <p style='color:#090909;font-size: 16px;'>${item.introduction}</p>
                                <p style='color:#010491;font-size: 12px;'>${item.afrist} ${item.date}</p>
                            </a>
                        </li>
                        <hr>
                    </div>
                </c:forEach>
            </ul>
            <br><br><br>
        </div>
        <div class="frontnote" style="display: none;">
              <ul>
                <c:forEach items="${frontnote}" var="item">
                    <br>
                    <div class="blist">
                        <li>
                            <a onclick="" href="read.jsp?articleid=${item.articleid}" target="_blank"
                               style="text-decoration: none;">
                                <h2>${item.title}</h2>
                                <p style='color:#090909;font-size: 16px;'>${item.introduction}</p>
                                <p style='color:#010491;font-size: 12px;'>${item.afrist} ${item.date}</p>
                            </a>
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
<script type="text/javascript">
    //点击左边栏的时候，显示对于栏目，然后隐藏其他栏目
    function fun1() {
        document.getElementsByClassName('coder')[0].style.display = "block";document.getElementsByClassName('algorithm')[0].style.display = "none";
        document.getElementsByClassName('note')[0].style.display = "none";document.getElementsByClassName('Javanote')[0].style.display = "none";
        document.getElementsByClassName('frontnote')[0].style.display = "none";

        document.getElementsByClassName('acoder')[0].style.backgroundColor = "#2c99b0";document.getElementsByClassName('aalgorithm')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('anote')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aJavanote')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('afrontnote')[0].style.backgroundColor = "#343434";
    }
    function fun2() {
        document.getElementsByClassName('coder')[0].style.display = "none";document.getElementsByClassName('algorithm')[0].style.display = "block";
        document.getElementsByClassName('note')[0].style.display = "none";document.getElementsByClassName('Javanote')[0].style.display = "none";
        document.getElementsByClassName('frontnote')[0].style.display = "none";
        document.getElementsByClassName('acoder')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aalgorithm')[0].style.backgroundColor = "#2c99b0";
        document.getElementsByClassName('anote')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aJavanote')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('afrontnote')[0].style.backgroundColor = "#343434";
    }
    function fun3() {
        document.getElementsByClassName('coder')[0].style.display = "none";document.getElementsByClassName('algorithm')[0].style.display = "none";
        document.getElementsByClassName('note')[0].style.display = "block";document.getElementsByClassName('Javanote')[0].style.display = "none";
        document.getElementsByClassName('frontnote')[0].style.display = "none";

        document.getElementsByClassName('acoder')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aalgorithm')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('anote')[0].style.backgroundColor = "#2c99b0";document.getElementsByClassName('aJavanote')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('afrontnote')[0].style.backgroundColor = "#343434";
    }
    function fun4() {
        document.getElementsByClassName('coder')[0].style.display = "none";document.getElementsByClassName('algorithm')[0].style.display = "none";
        document.getElementsByClassName('note')[0].style.display = "none";document.getElementsByClassName('Javanote')[0].style.display = "block";
        document.getElementsByClassName('frontnote')[0].style.display = "none";

        document.getElementsByClassName('acoder')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aalgorithm')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('anote')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aJavanote')[0].style.backgroundColor = "#2c99b0";
        document.getElementsByClassName('afrontnote')[0].style.backgroundColor = "#343434";
    }
    function fun5() {
        document.getElementsByClassName('coder')[0].style.display = "none";document.getElementsByClassName('algorithm')[0].style.display = "none";
        document.getElementsByClassName('note')[0].style.display = "none";document.getElementsByClassName('Javanote')[0].style.display = "none";
        document.getElementsByClassName('frontnote')[0].style.display = "block";

        document.getElementsByClassName('acoder')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aalgorithm')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('anote')[0].style.backgroundColor = "#343434";document.getElementsByClassName('aJavanote')[0].style.backgroundColor = "#343434";
        document.getElementsByClassName('afrontnote')[0].style.backgroundColor = "#2c99b0";
    }

</script>
</html>
