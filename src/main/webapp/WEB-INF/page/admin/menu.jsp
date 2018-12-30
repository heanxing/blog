<%--
  Created by IntelliJ IDEA.
  User: heanxing
  Date: 2018/12/28
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/icomoon.css" rel="stylesheet" />
    <!--动画-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/animate.css" rel="stylesheet" />
    <!--骨架样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/common.css" rel="stylesheet" />
    <!--皮肤（缇娜）-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/skin/tina.css" rel="stylesheet" />
    <!--jquery，不可修改版本-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/lib/jquery-1.7.2.min.js"></script>
    <!--全局动态修改-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/common.js"></script>
    <!--核心组件-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex.min.js"></script>
    <!--表单验证-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex-formVerify.js"></script>
</head>
<body>

<ul>
    <li class="menu-item">
        <a href="javascript:;"><span class="icon-home2"></span>主页</a>
    </li>
    <li class="menu-item">
        <a href="javascript:;"><span class="icon-bar-chart"></span>分类管理<i class="icon-keyboard_arrow_left"></i></a>
        <ul>
            <li><a href="${pageContext.request.contextPath}/type/list.action">文章分类</a></li>

        </ul>
    </li>
    <li class="menu-item">
        <a href="javascript:;"><span class="icon-magic"></span>文章管理<i class="icon-keyboard_arrow_left"></i></a>
        <ul>
            <li><a href="javascript:;">文章列表</a></li>
            <li><a href="javascript:;">回收站</a></li>

        </ul>
    </li>
</ul>

</body>
<script>
    javaex.menu({
        id : "menu",	// 菜单id
        isAutoSelected : true
    });
</script>
</html>
