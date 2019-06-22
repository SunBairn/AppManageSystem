<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/5/22
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <div class="layui-logo">APP信息管理系统</div>

    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="" class="layui-nav-img">
                水哥
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${zls}/dev/logout">退了</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">APP账户管理</a>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="javascript:;">列表一</a></dd>--%>
<%--                    <dd><a href="javascript:;">列表二</a></dd>--%>
<%--                    <dd><a href="javascript:;">列表三</a></dd>--%>
<%--                </dl>--%>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">APP应用管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${zls}/app/index/devId/${sessionScope.devUser.id}">APP维护</a></dd>
                    <dd><a href="${zls}/app/toAdd">添加APP基础信息</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>