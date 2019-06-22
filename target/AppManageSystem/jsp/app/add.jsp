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
            <form name="aaa"  class="layui-form" action="${zls}/app/addOne" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareName"  autocomplete="off"  placeholder="请输入软件名称"
                                   lay-verify="required" lay-reqtext="111"   class="layui-input">
                        </div> <label class="layui-form-label">APK名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="apkName"  autocomplete="off" lay-verify="title" placeholder="请输入APK的名称"
                                      class="layui-input">
                        </div> <label class="layui-form-label">支持ROM</label>
                        <div class="layui-input-inline">
                            <input type="text" name="supportRom"  autocomplete="off" lay-verify="title" placeholder="支持的ROM版本"
                                      class="layui-input">
                        </div>
                        <label class="layui-form-label">界面语言</label>
                        <div class="layui-input-inline">
                            <input type="text" name="interfaceLanguage"  autocomplete="off" lay-verify="title" placeholder="请输入界面语言"
                                      class="layui-input">
                        </div>
                        <label class="layui-form-label">软件大小</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareSize"  autocomplete="off" lay-verify="title" placeholder="请输入软件大小"
                                      class="layui-input">
                        </div>
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                            <select name="status" lay-filter="status">
                                <option value="0">--待审核--</option>
                            </select>
                        </div>
                        <label class="layui-form-label">所属平台</label>
                        <div class="layui-input-inline">
                            <select name="flatform.valueId" lay-filter="flatform" lay-verify="required" lay-reqtext="所属平台是必选的！">
                                <option value="">--请选择--</option>
                                <c:forEach items="${appFlatform}" var="obj">
                                    <option value="${obj.valueId}">${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">一级分类</label>
                        <div class="layui-input-inline">
                            <select name="categoryLevel1.id" id="levelOne" lay-filter="levelOne">
                                <option value="">--请选择--</option>
                                <c:forEach items="${level1}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}</option>
                            </c:forEach>
                            </select>
                        </div>
                        <label class="layui-form-label">二级分类</label>
                        <div class="layui-input-inline">
                            <select name="categoryLevel2.id" id="levelTwo"  lay-filter="levelTwo" >
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                        <label class="layui-form-label">三级分类</label>
                        <div class="layui-input-inline">
                            <select name="categoryLevel3.id" id="levelThree"  lay-filter="levelThree" >
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                        <label class="layui-form-label">应用简介</label>
                        <div class="layui-input-inline">
                            <input type="text" name="appInfo"  autocomplete="off" lay-verify="title" placeholder="应用简介"
                                      class="layui-input layui-elip">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="add">添加</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="/jsp/common/footer.jsp"/>
</div>
<%--引入JS--%>
<script type="text/javascript"  src="${zls}/static/plugins/layui/layui.js" charset="UTF-8"></script>
<script charset="UTF-8">
    //JavaScript代码区域
    layui.use(['element','form','jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $=layui.jquery;






      //二级分类start==============================================
       form.on('select(levelOne)',function () {
            //获取Id
           var levelOneId=$('#levelOne').val();
            if (levelOneId==''){
                var html='<option value="">--请选择--</option>';
                $("#levelTwo").html(html);
                $("#levelThree").html(html);
                form.render();
            }
            $.ajax({
                url:'${zls}/category/queryLevelTwoByLevelOne/'+levelOneId,
                type:'get',
                success:function (data) {
                    //根据data修改数据，重新渲染
                    var html='<option value="">--请选择--</option>';
                    var length=data.length;
                    for (var i=0;i<length;i++) {
                        html+='<option value="'+data[i].id+'">'+data[i].categoryName+'</option>';
                    }
                    $('#levelTwo').html(html);
                    form.render();
                }
            });

        });
       //二级分类end============================================

        //三级分类start==============================================
        form.on('select(levelTwo)',function () {
            //获取Id
            var levelTwoId=$('#levelTwo').val();
            if (levelTwoId==''){
                var html='<option value="">--请选择--</option>'
                $("#levelThree").html(html);
                form.render();
            }
            $.ajax({
                url:'${zls}/category/queryLevelThreeByLevelTwo/'+levelTwoId,
                type:'get',
                success:function (data) {
                    //根据data修改数据，重新渲染
                    var html='<option value="">--请选择--</option>';
                    var length=data.length;
                    for (var i=0;i<length;i++) {
                        html+='<option value="'+data[i].id+'">'+data[i].categoryName+'</option>';
                    }
                    $('#levelThree').html(html);
                    //注意这里一定要重新渲染
                    form.render();
                }
            });

        });
        //三级分类end============================================

        // form.on('submit(add)',function () {
        //     var flag=$(this).attr('flag');
        //     layer.alert('添加成功', {icon: 6});
        //     if (flag=="null"){
        //         return;
        //     } else if (flag=="true"){
        //         layer.alert('添加成功', {icon: 6});
        //     }else {
        //         layer.msg('添加失败', {icon: 5});
        //     }
    });

</script>
</body>
</html>
