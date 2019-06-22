<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>开发者平台登录</title>
    <link rel="stylesheet" href="${zls}/static/plugins/layui/css/layui.css"/>
    <style>
        form{
            width: 500px;
            margin: auto;
            margin-top: 10%;
        }
    </style>
    <%--引入JS--%>
    <script type="text/javascript"  src="${zls}/static/plugins/layui/layui.js" charset="UTF-8"></script>
    <script charset="UTF-8">
        //JavaScript代码区域
        layui.use(['element'], function(){
            var element = layui.element;
        });
    </script>
</head>
<body style="background-color: #E6E6E6">
    <div class="layui-container">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 200px;margin-left:27%;width: 300px">
            <legend style="margin-left: 20%;font-size: 24px">APP开发者平台</legend>
        </fieldset>
        <form action="${zls}/dev/login" method="post" class="layui-form" style="margin-top: 0px">
            <div class="layui-form-item">
                <div class="layui-input-inline" style="width:60%">
                    <input type="text" name="devCode" required lay-verify="required" placeholder="请输入用户名"
                           autocomplete="off" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline" style="width:60%">
                    <input type="password" name="devPassword" required lay-verify="required" placeholder="请输入密码"
                           autocomplete="off" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline" style="margin-left: 12%">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
