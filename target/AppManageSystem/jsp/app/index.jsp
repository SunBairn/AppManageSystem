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
            <form name="aaa" class="layui-form" action="${zls}/app/query" method="post">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="hidden" name="pageNum" value="1">
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareName"  autocomplete="off" lay-verify="title" placeholder="请输入软件名称"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                            <select name="appStatus" lay-filter="aihao" >
                                <option value="">--请选择--</option>
                                <c:forEach items="${appStatus}" var="obj">
                                    <option value="${obj.valueId}">${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label class="layui-form-label">所属平台</label>
                        <div class="layui-input-inline">
                            <select name="appFlatform" lay-filter="aihao" >
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
                            <select name="levelOne" id="levelOne" lay-filter="levelOne">
                                <option value="">--请选择--</option>
                                <c:forEach items="${level1}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}</option>
                            </c:forEach>
                            </select>
                        </div>
                        <label class="layui-form-label">二级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelTwo" id="levelTwo"  lay-filter="levelTwo" >
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                        <label class="layui-form-label">三级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelThree" id="levelThree"  lay-filter="levelThree" >
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="search">查询</button>
                        </div>
                    </div>
                </div>
            </form>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小</th>
                        <th>所属平台</th>
                        <th>所属分类（一级分类、二级分类、三级分类）</th>
                        <th>状态</th>
                        <th>下载次数</th>
                        <th>最新版本号</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.softwareName}</td>
                            <td>${obj.apkName}</td>
                            <td>${obj.softwareSize}</td>
                            <td>
                                <c:if test="${obj.flatform.valueId eq 1}">手机</c:if>
                                <c:if test="${obj.flatform.valueId eq 2}">平板</c:if>
                                <c:if test="${obj.flatform.valueId eq 3}">通用</c:if>
                            </td>
                            <td>
                                ${obj.categoryLevel1.categoryName}->${obj.categoryLevel2.categoryName}->${obj.categoryLevel3.categoryName}
                            </td>
                            <td>${obj.appStatus.valueName}</td>
                            <td>${obj.downloads}</td>
                            <td>${obj.newAppVersion.versionNo}</td>
                            <td style="width:140px;">
                                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" href="${zls}/app/detail/appId/${obj.id}">查看</a>
                                <a class="layui-btn layui-btn-xs" lay-event="edit" href="${zls}/app/toEditor/appId/${obj.id}">编辑</a>
                                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" href="${zls}/app/delete/appId/${obj.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td >共${page.total}条记录  第${page.pageNum}页/${page.pages}页</td>
                        <td colspan="8">
                            <a href="javascript:void(0);" page="first">首页</a>
                            <a href="javascript:void(0);" page="prev">上一页</a>
                            <a href="javascript:void(0);" page="next">下一页</a>
                            <a href="javascript:void(0);" page="last">尾页</a>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="/jsp/common/footer.jsp"/>
</div>
<%--引入JS--%>
<script  src="${zls}/static/plugins/layui/layui.js"></script>
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

        //分页事件start=========================================
        $('a[page]').click(function () {
            var pageNum=1;
            var currPage='${page.pageNum}';
            var totalPages='${page.pages}';
            var v=$(this).attr('page');//获取当前Page的值
            switch (v) {
                case "first":
                    pageNum=1;
                    break;
                case "prev":
                    pageNum=parseInt(currPage)-1;
                    if (pageNum < 1) {
                        pageNum=1;
                    }
                    break;
                case "next":
                    pageNum=parseInt(currPage)+1;
                    if (pageNum > totalPages) {
                        pageNum=totalPages;
                    }
                    break;
                case "last":
                    pageNum=totalPages;
                    break;
            }
            //更新隐藏域的值
            $('input[name=pageNum]').val(pageNum);
           // alert($('input[name=pageNum]').val())
            //提交表单
            $('form').submit();
        })
        //分页事件end=========================================

        //查看某个APP的具体信息事件start==============================================
        $('a[lay-event]').click(function () {
            var v=$(this).attr('lay-event');
            var flag=$(this).attr('flag');

        });

        //查看事件end=============================================
    });

</script>
</body>
</html>
