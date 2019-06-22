<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>APP管理系统</title>
    <link rel="stylesheet" href="${zls}/static/plugins/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">内容主体区域</div>
    </div>

    <jsp:include page="/jsp/common/footer.jsp"/>
</div>
<%--引入JS--%>
<script src="${zls}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>
