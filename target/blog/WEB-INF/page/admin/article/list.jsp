
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>文章管理</title>
    <!--字体图标-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/icomoon.css" rel="stylesheet" />

</head>
<body>
<div class="admin-left">
    <div class="logo">
        <h1>博客后台</h1>
    </div>
    <div id="menu" class="menu">
        <c:import url="../menu.jsp"></c:import>
    </div>
</div>

<!--右侧内容-->
<div class="admin-right">
    <!--顶部-->
    <div class="admin-header">
        <c:import url="../header.jsp"></c:import>

    </div>
    <!--内容-->
    <div class="admin-content">
    <!--面包屑导航-->
    <div class="content-header">
    <div class="breadcrumb">
    <span>文章管理</span>
    <span class="divider">/</span>
    <span class="active">文管列表</span>
    </div>
    </div>

    <!--全部主体内容-->
        <div class="list-content">
            <!--块元素-->
            <div class="block">
                <!--页面有多个表格时，可以用于标识表格-->
                <h2>标题</h2>
                <!--右上角的返回按钮-->
                <a href="javascript:history.back();">
                    <button class="button wathet" style="position: absolute;right: 20px;top: 16px;"><span class="icon-arrow_back"></span> 返回</button>
                </a>

                <!--正文内容-->
                <div class="main">
                    <%--<!--表格上方的搜索操作-->--%>
                    <%--<div class="admin-search">--%>
                    <%--<div class="input-group">--%>
                    <%--<input type="text" class="text" placeholder="提示信息" />--%>
                    <%--<button class="button blue">搜索</button>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <!--表格上方的操作元素，添加、删除等-->
                    <div class="operation-wrap">
                        <div class="buttons-wrap">
                            <a href="edit.action">  <!--为了防止按钮文字和图标紧紧贴着，请在文字前敲一个空格-->
                                <button id="add" class="button blue"><span class="icon-plus"></span> 添加</button></a>


                        </div>
                    </div>
                    <table id="table" class="table color2">
                        <thead>
                        <tr>
                            <th style="width: 20px" ><input type="checkbox" class="fill listen-1" /> </th>
                            <th  style="width: 60px">序号</th>
                            <th>分类</th>
                            <th>文章标题</th>
                            <th>阅读量</th>
                            <th>攥写日志</th>
                            <th>编辑</th>


                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${fn:length(list)==0}">
                                <tr>
                                    <td colspan="6" style="text-align: center">暂无记录</td>
                                </tr>

                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${pageInfo.list}" var="entity" varStatus="status">
                                    <tr>
                                        <td>${status.index+1}</td>
                                        <td>${entity.id}</td>
                                        <td>${entity.id}</td>
                                    </tr>

                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        </tbody>



                    </table>

                </div>

            </div>

        </div>

</div>
</div>
</body>
<script>
    javaex.table({
        id : "table",	// 表格id
        mergeColArr : [3, 4]	// 第3、4列根据内容自动合并
    });
</script>


</html>
