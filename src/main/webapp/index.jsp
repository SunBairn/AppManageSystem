<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>APP管理系统</title>
    <style>
        body{
            margin: 0;
            padding: 0;
            background-color: #e8e8e8;
            line-height: 3em;
        }
        .container{
            margin-top: 10%;
            margin-left: 30%;
        }
        a:hover { text-decoration:underline;color: red}
        a:link { text-decoration: none;color: blue}
    </style>
</head>
<body>
<div class="container">
    <h1 style="font-size: 50px;letter-spacing: 10px; font-weight: 500">APP信息管理平台</h1>
    <a style="font-size:26px; text-decoration:none;" href="${zls}/dev/toLogin">APP开发者平台入口</a><br>
    <a style="font-size:26px; text-decoration:none;" href="${zls}/backend/toLogin">后台管理系统入口</a>
</div>

</body>
</html>
