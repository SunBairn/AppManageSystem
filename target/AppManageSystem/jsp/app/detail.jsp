<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>APP管理系统</title>
    <link rel="stylesheet" href="${zls}/static/plugins/layui/css/layui.css"/>
    <meta charset="UTF-8">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form name="aaa" class="layui-form" action="${zls}/app/index/devId/${sessionScope.get("USER_ID")}" method="post">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>软件基础信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareName" autocomplete="off" lay-verify="title"
                                   class="layui-input" value="${appInfoOne.softwareName}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">APK名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="apkName" autocomplete="off" lay-verify="title"
                                   class="layui-input layui-elip" value="${appInfoOne.apkName}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">支持ROM</label>
                        <div class="layui-input-inline">
                            <input type="text" name="supportRom" autocomplete="off" lay-verify="title"
                                   class="layui-input" value="${appInfoOne.supportRom}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">界面语言</label>
                        <div class="layui-input-inline">
                            <input type="text" name="interfaceLanguage" autocomplete="off" lay-verify="title"
                                   class="layui-input" value="${appInfoOne.interfaceLanguage}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">软件大小</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareSize" autocomplete="off" lay-verify="title"
                                   class="layui-input" value="${appInfoOne.softwareSize}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">应用简介</label>
                        <div class="layui-input-inline">
                            <input type="" name="appInfo" autocomplete="off" lay-verify="title"
                                   class="layui-input layui-elip" value="${appInfoOne.appInfo}">
                        </div>
                    </div>
                </div>
            </form>
            <form name="aaa" class="layui-form" action="${zls}/app/index/devId/${sessionScope.get("USER_ID")}" method="post">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>历史版本信息</legend>
                </fieldset>
                <table class="layui-table ">
                    <thead>
                    <tr>
                        <th>版本编号</th>
                        <th>APK文件名称</th>
                        <th>APK位置</th>
                        <th>下载链接</th>
                        <th>版本大小</th>
                        <th>版本信息</th>
                        <th>发布状态</th>
                    </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${appInfoOne.appVersions}" var="obj">
                            <tr>
                                <td>${obj.versionNo}</td>
                                <td>${obj.apkFilename}</td>
                                <td>${obj.apklocPath}</td>
                                <td><a href="${obj.downloadLink}">下载</a></td>
                                <td>${obj.versionSize}</td>
                                <td>${obj.versionInfo}</td>
                                <td>
                                    <c:if test="${obj.publishStatus eq 1}">不发布</c:if>
                                    <c:if test="${obj.publishStatus eq 2}">已发布</c:if>
                                    <c:if test="${obj.publishStatus eq 3}">预发布</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button class="layui-btn" lay-submit lay-filter="search">返回</button>
            </form>
        </div>
    </div>

    <jsp:include page="/jsp/common/footer.jsp"/>
</div>
<%--引入JS--%>
<script src="${zls}/static/plugins/layui/layui.js"></script>
<script charset="UTF-8">
    //JavaScript代码区域
    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;

    });
</script>
</body>
</html>
