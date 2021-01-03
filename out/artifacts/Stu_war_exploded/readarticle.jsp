<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/10/3
  Time: 10:54
  To change this template use File | Settings | File Templates.
  点一下 博客之后会进入后台，查询之后文章，setAttribute（不存session）
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>read</title>
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
</head>
<body>
<div style=" z-index: 10">
    <div class="articlecontent">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    <h1 class="">${arti.title }</h1>
                    <p style="font-size:16px;color:#00dbff">作者：${arti.author }</p>
                    <span>文章标签：${arti.atags }</span>
                </div>
            </div>
            <div class="panel-body">
                <!-- 用于显示md编辑器的md格式 -->
                <div id="doc-content">
                    <textarea style="display: none;">${arti.html}</textarea>
                </div>
            </div>
        </div>
        <div class="articlecomment">
            <form class="artcomment" id="artcomment" name="artcomment" action="commentform">
                <fieldset>
                    <legend>评论区</legend>
                        <input type="hidden" name="articleauthor" class="articleauthor" id="articleauthor" value="${messageModel.object.nickName}">
                        <input type="hidden" name="articlehead" id="articlehead"  class="articlehead" value="${messageModel.object.headsrc}">
                        <input type="hidden" name="useremail"  value="${messageModel.object.email}">
                        <input type="hidden" name="userheadsrc"  value="${messageModel.object.headsrc}">
                        <input type="hidden" name="articleid"  value="${arti.articleid}">
                </fieldset>
            </form>
            <textarea name="editorContent"  id="remarkEditor" placeholder="请输入内容" class="textconment" form="artcomment"></textarea>
            <button class="submitcomment" id="submitcomment" name="submitcomment" onclick="cz()" onkeypress="cz()">发表评论</button>
            <ul class="items"></ul>
        </div>
    </div>
</div>
<div class="frist" style=" z-index: -1">
    <img class="backpic" src="../images/back.jpg">
</div>
</body>
<script type="text/javascript" src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script type="text/javascript">
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
    function cz(){

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型，传递方式
            dataType: "json",//预期服务器返回的数据类型
            url: "/commentform" ,//url，就是form里面的action，不要忘了url前面加/
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
        var index = Math.floor(Math.random()*2);
        img.style.width = "50px";
        img.style.height = "50px";
        img.style.borderRadius = "50%";
        var articlehead = $("#articlehead").val();
        img.setAttribute('src',articlehead);
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

        libt.innerHTML = articleauthor+":"+jio.value;//填充内容
        //创建板块
        //创建时间板块
        var tbk  = document.createElement('span');
        hfather.appendChild(tbk);
        tbk.style.marginLeft = "15px";
        tbk.style.color = "blue";
        tbk.innerHTML = "发表时间:" + nian + "-" + (dt+1) + "-" + r  + "&nbsp;"
        jio.value = "";//清空评论输入框

    }
</script>

</html>
