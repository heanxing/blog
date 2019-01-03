
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
    <span class="active">文章编辑</span>
    </div>
    </div>

    <!--全部主体内容-->
        <!--全部主体内容-->
        <div class="list-content">
            <!--块元素-->
            <div class="block">
                <!--修饰块元素名称-->
                <div class="banner">
                    <p class="tab fixed">文章编辑 Article editor</p>
                </div>

                <!--正文内容-->
                <div class="main">
                    <form id="form">
                        <!--文本框-->
                        <div class="unit clear">
                            <div class="left">
                              <p class="subtitle">标题</p>
                            </div>
                            <div class="right">
                                <input type="text" class="text" data-type="必填"  error-pos="42" placeholder="请输入文章标题" />
                            </div>
                        </div>





                        <!--下拉选择框-->
                        <div class="unit clear">
                            <div class="left"><p class="subtitle">文章分类</p></div>
                            <div class="right">
                                <select id="type_id">

                                    <c:forEach items="${typeList}" var="typeInfo" varStatus="status">
                                        <option value="${typeInfo.id}">${typeInfo.name}</option>
                                    </c:forEach>





                                </select>
                            </div>
                        </div>


                        <!--文章封面-->
                        <div class="unit clear">
                            <div class="left"><p class="subtitle">文章封面</p></div>
                            <div class="right">

                                <!--文章封面-->
                                <div id="container" class="file-container" style="width:132px;height:74px;">
                                    <img src="${pageContext.request.contextPath}/static/javaex/pc/images/default.png" width="100%" height="100%" />
                                    <input type="file" class="file" id="upload" accept="image/gif, image/jpeg, image/jpg, image/png" />
                                </div>

                            </div>
                        </div>


                            <!--内容-->
                        <div class="unit clear">
                            <div class="left"><p class="subtitle">内容</p></div>
                            <div class="right">
                                <div id="edit" class="edit-container"></div>

                        </div>







                        <!--提交按钮-->
                        <div class="unit clear" style="width: 800px;">
                            <div style="text-align: center;">
                                <!--表单提交时，必须是input元素，并指定type类型为button，否则ajax提交时，会返回error回调函数-->
                                <input type="button" id="return" class="button no" value="返回" />
                                <input type="button" id="save" class="button yes" value="保存" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            javaex.select({
                id : "select",
                isSearch : false
            });



            javaex.tag({
                id : "tag"
            });

            // 监听点击保存按钮事件
            $("#save").click(function() {
                // 表单验证函数
                if (javaexVerify()) {

                }
            });

            // 监听点击返回按钮事件
            $("#return").click(function() {
                alert("返回");

            });
        </script>

        </div>

    </div>
</div>
</body>


//文章编辑器
<script>
    javaex.edit({
        id : "edit",
        image : {
            url : "${pageContext.request.contextPath}/upload/upload.json",	// 请求路径
            param : "file",		// 参数名称，SSM中与MultipartFile的参数名保持一致
            dataType : "url",	// 返回的数据类型：base64 或 url
            rtn : "rtnData",	// 后台返回的数据对象，在前面页面用该名字存储
            imgUrl : "data.imgUrl",	// 根据返回的数据对象，获取图片地址。  例如后台返回的数据为：{code: "000000", message: "操作成功！", data: {imgUrl: "1.jpg"}}
            prefix : "/upload/"	// 图片地址的前缀，根据实际情况决定是否需要填写
        },
        content : '',	// 这里必须是单引号，因为html代码中都是双引号，会产生冲突
        callback : function(rtn) {
            $("#contentHtml").val(rtn.html);
            $("#contentText").val(rtn.text);
        }
    });
</script>


//文章封面
<script>
    javaex.upload({
        type : "image",
        id : "upload",	// <input type="file" />的id
        url:"${pageContext.request.contextPath}/article/upload.json",
        param:"file",
        dataType : "url",	// 返回的数据类型：base64 或 url
        callback : function (rtn) {

			console.log(rtn);
//			if (rtn.code=="200") {
//				$("#container img").attr("src", "/upload/"+rtn.data.imgUrl);
//			} else {
//				javaex.optTip({
//					content : rtn.message,
//					type : "error"
//				});
//			}
        }
    });
</script>


</html>
