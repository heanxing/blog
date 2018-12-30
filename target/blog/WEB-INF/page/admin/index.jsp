
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理系统</title>

    <!--字体图标-->
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
<!--左侧菜单-->
<div class="admin-left">
    <div class="logo">
        <h1>博客后台</h1>
    </div>
    <div id="menu" class="menu">
        <c:import url="menu.jsp"></c:import>
    </div>
</div>

<!--右侧内容-->
<div class="admin-right">
    <!--顶部-->
    <div class="admin-header">
        <c:import url="header.jsp"></c:import>

    </div>

    <%--<!--内容-->--%>
    <%--<div class="admin-content">--%>
        <%--<!--面包屑导航-->--%>
        <%--<div class="content-header">--%>
            <%--<div class="breadcrumb">--%>
                <%--<span>一级菜单名称</span>--%>
                <%--<span class="divider">/</span>--%>
                <%--<span class="active">二级菜单名称</span>--%>
            <%--</div>--%>
        <%--</div>--%>

        <%--<!--全部主体内容-->--%>
        <%--<div class="list-content">--%>

        <%--</div>--%>
    </div>
</div>
</body>

</html>
