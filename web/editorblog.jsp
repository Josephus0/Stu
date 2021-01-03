<%--
  Created by IntelliJ IDEA.
  User: Zhang
  Date: 2020/10/5
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑博客</title>
    <link rel="stylesheet" href="../css/editormd.css" />
    <!-- <link rel="stylesheet" href="css/katex.min.css" /> -->
    <link rel="stylesheet" type="text/css" href="../css/indexx.css">
    <link rel="stylesheet" type="text/css" href="../css/Mark.css">
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
</head>
<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document" >
        <div class="modal-content" style="height:580px;width: 500px">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">发布文章</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="articleform"  action="editorartic" method="post">
                    <div class="form-group">
                        <p style="background-color: #ffe2d4">请勿发布涉及政治、广告、营销、翻墙、违反国家法律法规等内容</p>
                        <label>文章标签:</label><input type="text" class="form-control" id="atags" name="atags">
                        <label>分类专栏:</label><input type="text" class="form-control" id="aclass" name="aclass">
                        <label>是否原创(原创/非原创):</label>
                        <select class="form-control" id="afrist" name="afrist">
                            <option value="原创">原创</option>
                            <option value="转载">转载</option>
                            <option value="翻译">翻译</option>
                        </select>
                        <input type="hidden" name="articleid"  value="${artiread.articleid}">
                        <label>简介:</label><input type="text" class="form-control" id="brief" name="brief">
                        <label>作者:</label><input type="text" class="form-control" id="author" name="author" value="${messageModel.object.nickName}">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="Release()">发布文章</button>
            </div>
        </div>
    </div>
</div>
<div class="MarkTop" style="position: absolute; z-index: 10">
    <ul>
        <li><a class="ComeBack" href="../homepage.jsp"><b>&lt;返回首页</b></a></li>
        <li><input class="Blogtitle" placeholder="Title" name="title" form="articleform" value="${artiread.title }"></li>
        <li><button type="button" id="MarkBtn1" class="MarkBtn1"></button></li>
        <li><button type="button" id="MarkBtn2" class="MarkBtn2" data-toggle="modal" data-target="#myModal">发布文章</button></li>
    </ul>
</div>
<div class="frist">
    <img class="backpic" src="../images/back.jpg">
</div>
<div id="deditor" class="Markdown">
    <textarea style="display:none;" form="articleform" name="txttextarea">${artiread.html}</textarea>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/editormd.js"></script>
<!-- <script src="js/katex.min.js"></script> -->
<script src="../js/uploadImg.js" type="text/javascript"></script>
<script type="text/javascript">

    function Release() {
        alert("修改成功");
        $("#articleform").submit();
    }

    var testEditor;
    $(function () {
        //$.get('test.md', function(md){  //如果是放在网站程序中的可以打开注释

        testEditor = editormd({
            id:"deditor",//注意：这里是上面DIV的id
            width:"90%",
            height:640,
            syncScrolling: "single",
            path:"lib/",

            theme : "dark",
            previewTheme : "dark",
            editorTheme : "pastel-on-dark",
            //markdown : md,
            codeFold : true,
            saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea
            searchReplace : true,
            //watch : false,                // 关闭实时预览
            htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
            //toolbar  : false,             //关闭工具栏
            //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
            emoji : true,
            taskList : true,
            tocm            : true,         // Using [TOCM]
            tex : true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart : true,             // 开启流程图支持，默认关闭
            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
            toolbarIcons : function() {  //自定义工具栏，后面有详细介绍
                return editormd.toolbarModes['full']; // full, simple, mini
            },

            imageUpload : true, //必须
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/Uploadimggga",

        });});
</script>
</body>
</html>
