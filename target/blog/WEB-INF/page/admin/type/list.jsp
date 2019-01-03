
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
    <span>文章分类</span>
    <span class="divider">/</span>
    <span class="active">分类管理</span>
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
                            <!--为了防止按钮文字和图标紧紧贴着，请在文字前敲一个空格-->
                            <button id="add" class="button blue"><span class="icon-plus"></span> 添加</button>
                            <button id="save" class="button green"><span class="icon-check"></span> 保存</button>
                            <button id="delete" class="button red "> <span class="icon-remove"></span>删除</button>
                        </div>
                    </div>
                    <table id="table" class="table color2">
                        <thead>
                        <tr>
                            <th  style="width: 20px"class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
                            <th style="width: 30%">序排序</th>
                            <th>分类名称</th>


                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="entity" varStatus="status">
                            <tr>
                                <td  class="checkbox"><input type="checkbox" class="fill listen-1-2"  name="id" value="${entity.id}"/> </td>
                                <td ><input type="text" class="text" name="sort" datatype="正整数" onerror-msg="必须输入正整数" value="${entity.sort}" /></td>
                                <td><input type="text" class="text" name="name"  onerror-msg="必须输入名称" value="${entity.name}" /></td>

                            </tr>

                        </c:forEach>

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
<script>
    javaex.page({
        id : "page",
        pageCount : 12,	// 总页数
        currentPage : 1,// 默认选中第几页
        position : "left",
        // 返回当前选中的页数
        callback : function(rtn) {
            alert("当前选中的页数：" + rtn.pageNum);
        }
    });
</script>
<script>
    var idArr = new Array();
    var sortArr = new Array();
    var nameArr = new Array();

    //点金产生页面
    $("#add").click( function () {
        var html= '';
        html +='<tr>';
        html +='<td class="checkbox"><input type="checkbox" class="fill listen-1-2"  name="id" value="${entity.id}"/> </td>';
        html +='<td><input type="text" class="text" name="sort" datatype="正整数" onerror-msg="必须输入正整数" value="${entity.sort}"/></td>';
        html +='<td><input type="text" class="text" name="name" datatype="必填" placeholder="请输入分类名称" value="" /></td>';
        html +='</tr>';
        $("#table tbody").append(html);
        javaex.render();
    });

    //保存按钮点击事件

    $("#save").click( function () {
        if (javaexVerify()){

            idArr = [];
            sortArr = [];
            nameArr = [];

            //id
            $(':checkbox[name="id"]').each(function () {
                idArr.push($(this).val());
            });

            //sort
            $('input[name="sort"]').each(function () {
                sortArr.push($(this).val());
            });

            //name
            $('input[name="name"]').each(function () {
                nameArr.push($(this).val());
            });
            console.log("idArr:"+idArr);
            console.log("sortArr:"+sortArr);
            console.log("nameArr:"+nameArr);

            $.ajax({
                url : "${pageContext.request.contextPath}/type/save.json",
                type : "POST",
                traditional : "true",
                data : {
                    "idArr" : idArr,
                    "sortArr" : sortArr,
                    "nameArr" : nameArr
                },
                success : function(rtn) {
                    console.log(rtn);
                    if (rtn.code == "200"){
                        javaex.optTip({
                            content : rtn.message
                        });
                        //建议延迟加载
                        setTimeout(function () {
                            window.location.reload();
                        },2000);

                    }else {
                        javaex.optTip({
                            content : rtn.message,
                            type : "error"
                        });

                    }

                }
            });

        }


    });

    //点击删除按钮事件
    $("#delete").click(function () {
        //1.0遍历所有被勾选的复选框
        $(':checkbox[name="id"]:checked').each(function () {
            //添加主键存在的记录
            var id = $(this).val();
            if(id!= ""){
                idArr.push(id);
         }
        });
        //判断勾选的是不是新增的空白记录
        if(idArr.length==0){
            $(':checkbox[name="id"]:checked').each(function () {
                //前台无刷新去除新增的tr
                $(this).parent().parent().parent().remove();

            });

        }
        else {
            $.ajax({
                url : "${pageContext.request.contextPath}/type/delete.json",
                type : "POST",
                traditional : "true",
                data : {
                    "idArr" : idArr
                },
                success : function(rtn) {
                    console.log(rtn);
                    if (rtn.code == "200"){
                        javaex.optTip({
                            content : rtn.message
                        });
                        //建议延迟加载
                        setTimeout(function () {
                            window.location.reload();
                        },2000);

                    }else {
                        javaex.optTip({
                            content : rtn.message,
                            type : "error"
                        });

                    }

                }
            });

        }



    });

</script>
</html>
