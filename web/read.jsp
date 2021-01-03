<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/10/5
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${artiread.title}</title>
    <link rel="stylesheet" type="text/css" href="../css/readarticle.css">
    <script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
    <script src="../lib/marked.min.js"></script>
    <script src="../lib/prettify.min.js"></script>
    <script src="../lib/raphael.min.js"></script>
    <script src="../lib/underscore.min.js"></script>
    <script src="../lib/sequence-diagram.min.js"></script>
    <script src="../lib/flowchart.min.js"></script>
    <script src="../lib/jquery.flowchart.min.js"></script>
    <script src="../js/editormd.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
    <script>
        window.onload = function () {
            var strid = ${param.articleid};
            var xmlhttp = ajaxFunction();
            xmlhttp.open("Post", "toread?articleid=" + strid, true);
            xmlhttp.send();
            var articleflag = $("#articleflag").val();
            if (strid==articleflag) {
                return;
            }else {location.reload();}
        }
        function isyiyang(str1,str2) {
            if (str1 == str2 ) {
                return false;
            }
            return true;
        }
        function isEmpty(str) {
            if (str == null || str.trim() == "") {
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

    </script>
</head>
<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document" >
        <div class="modal-content" style="height:150px;width: 300px">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">是否删除</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="Deletearticle()">确定</button>
            </div>
        </div>
    </div>
</div>
<div style=" z-index: 10">
    <div class="articlecontent">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    <h1 class="">${artiread.title }</h1>
                    <button class="deleteatr" data-toggle="modal" data-target="#myModal">删除</button>
                    <button class="deleteatr" onclick="tocollect('${artiread.articleid}','${artiread.title}')">收藏</button>
                    <a class="editoratrt" href="editorblog.jsp" arget="_blank" style="text-decoration: none;">编辑</a>
                    <p style="font-size:16px;color:#00dbff">作者：${artiread.author }</p>
                    <span>文章标签：${artiread.atags }</span>
                    <input type="hidden" name="articleflag" class="articleflag" id="articleflag"
                           value="${artiread.articleid }">
                </div>
            </div>
            <div class="panel-body">
                <!-- 用于显示md编辑器的md格式 -->
                <div id="doc-content">
                    <textarea style="display: none;">${artiread.html}</textarea>
                </div>
            </div>
        </div>
        <div class="articlecomment">
            <form class="artcomment" id="artcomment" name="artcomment" action="commentform">
                <fieldset>
                    <legend>评论区</legend>
                    <input type="hidden" name="articleauthor" class="articleauthor" id="articleauthor"
                           value="${messageModel.object.nickName}">
                    <input type="hidden" name="articlehead" id="articlehead" class="articlehead"
                           value="${messageModel.object.headsrc}">
                    <input type="hidden" name="useremail" value="${messageModel.object.email}">
                    <input type="hidden" name="userheadsrc" value="${messageModel.object.headsrc}">
                    <input type="hidden" name="articleid" value="${artiread.articleid}">
                </fieldset>
            </form>
            <form id="Deleteform" name="Deleteform" action="Deletearticle" method="post">
                <input type="hidden" name="articleid" value="${artiread.articleid}">
            </form>
            <textarea name="editorContent" id="remarkEditor" placeholder="请输入内容" class="textconment"
                      form="artcomment"></textarea>
            <button class="submitcomment" id="submitcomment" name="submitcomment" onclick="cz()" onkeypress="cz()">
                发表评论
            </button>
            <ul class="items">
                <c:forEach items="${Commentlist}" var="item">
                    <li style="list-style: none;">
                        <img src="${item.headsrc}" style=" width:50px;height :50px;border-radius: 50%;">
                        <div style="display:inline-block">
                            <p style="font-sizeSize:20px;color:black;font-weight: bold;margin-bottom: 5px;">${item.username}:${item.content}</p>
                            <span style="margin-left: 15px;color:blue;">发表时间:${item.contentdata}</span>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div>
</div>
<div class="frist" style=" z-index: -1">
    <img class="backpic" src="../images/back.jpg">
</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script type="text/javascript">

    function tocollect(str,str2){
        $.ajax({
            type: "POST",//方法类型，传递方式
            dataType: "json",//预期服务器返回的数据类型
            url: "/ConnectionBlog" ,//url，就是form里面的action，不要忘了url前面加/
            data: {articleid:str,articletitle:str2},//form的id
            success: function (result) {
                if (result.resultCode == 200) {
                    alert("已收藏");//提交成功
                }
                ;
            },
            error : function() {
                alert("已收藏！");
            }
        });

    }
    function Deletearticle(){
        $("#Deleteform").submit();
    }

    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true,
            theme: "dark",
            previewTheme: "dark",
        });
    });
    var jio = document.getElementsByClassName('textconment')[0];//获得多行文本框内容
    var time = new Date();//获得时间
    var nian = time.getFullYear();//获得年份
    var dt = time.getMonth();//获得月份
    var r = time.getDate();//获得日期
    //实现上传
    var items = document.getElementsByClassName('items')[0];//获得ul的节点属性
    function cz() {

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型，传递方式
            dataType: "json",//预期服务器返回的数据类型
            url: "/commentform",//url，就是form里面的action，不要忘了url前面加/
            data: $('#artcomment').serialize(),//form的id
        });
        //先创建li的节点
        var Li = document.createElement('li');
        //然后插入到ul中
        items.appendChild(Li);
        Li.style.listStyle = "none";
        //创建图片
        var img = document.createElement('img');
        Li.appendChild(img);//在li中插入图片
        var isz = ['images/HeadPic/1601603011511.jpg'];//一个图片的数组
        var index = Math.floor(Math.random() * 2);
        img.style.width = "50px";
        img.style.height = "50px";
        img.style.borderRadius = "50%";
        var articlehead = $("#articlehead").val();
        img.setAttribute('src', articlehead);
        //创建图片右边内容的大盒子
        var hfather = document.createElement('div');
        Li.appendChild(hfather);//插入大盒子
        //实现盒子左浮动
        hfather.style.display = "inline-block";

        //创建标题
        var libt = document.createElement('p');

        var articleauthor = $("#articleauthor").val();
        hfather.appendChild(libt);
        libt.style.fontSize = "20px";
        libt.style.color = "black";
        libt.style.fontWeight = "bloder";
        libt.style.marginBottom = "5px";

        libt.innerHTML = articleauthor + ":" + jio.value;//填充内容
        //创建板块
        //创建时间板块
        var tbk = document.createElement('span');
        hfather.appendChild(tbk);
        tbk.style.marginLeft = "15px";
        tbk.style.color = "blue";
        tbk.innerHTML = "发表时间:" + nian + "-" + (dt + 1) + "-" + r + "&nbsp;"
        jio.value = "";//清空评论输入框
    }
</script>

</html>
