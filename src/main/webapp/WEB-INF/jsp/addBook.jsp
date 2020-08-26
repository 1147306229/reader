<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加书籍信息</title>
</head>
<link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
<body>
<form class="layui-form" action="<%=path%>/book/addB" id="form1" target="nm_iframe">
    <div class="layui-form-item" style="margin-top: 20px">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" name="bookname" lay-verify="required" autocomplete="off" placeholder="请输入书名"
                   class="layui-input">
        </div>
    </div>


    <input type="hidden" name="uid" lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入作者名" value="2">


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-inline">
                <select id="type" lay-verify="required" lay-search="" name="tid">
                    <option value="0">请选择类型</option>
                </select>
            </div>
        </div>
            <div class="layui-inline">
                <label class="layui-form-label">图片</label>
                <div class="layui-input-inline">
                    <input type="text" name="bpath" lay-verify="required" autocomplete="off" class="layui-input" value="sx.jpg">
                </div>
            </div>
    </div>

    <div class="layui-form-item">
        <%--时间 --%>
        <input type="hidden" class="layui-input" id="test5" name="bcreatdate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>">
        <div class="layui-inline">
            <label class="layui-form-label">是否免费</label>
            <div class="layui-input-inline">
                <select id="bisfree" lay-verify="required" lay-search="" name="bisfree">
                    <option value="-1">请选择</option>
                    <option value="0">免费</option>
                    <option value="1">付费</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item" style="margin-bottom: 20px">
        <label class="layui-form-label">详细内容</label>
        <div class="layui-inline" style="width: 50%">
            <textarea placeholder="请输入详细内容" class="layui-textarea" id="bdetail" name="bdetail" style="width: 109%"></textarea>
        </div>
    </div>

    <div class="layui-input-block">
        <button class="layui-btn" lay-submit="" lay-filter="demo1">添加</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>
<%--实现form提交无刷新--%>
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
<script src="<%=path%>/statics/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var layedit = layui.layedit;
        var laydate = layui.laydate;
        var $ = layui.jquery;

        //日期时间选择器
        laydate.render({
            elem: '#test5'
            , type: 'datetime'
        });

        $(".layui-btn").on('click', function () {
            var i = $("#type").val();
            // if(i=="0"){
            //     return false;
            // }

        })

    });



</script>
<script src="<%=path%>/statics/js/jquery-1.12.4.min.js"></script>
<script src="<%=path%>/statics/js/jquery-form.js"></script>
<script>
    /*所有类型和自动选中类型*/
    $.ajax({
        url: "<%=path%>/type/query",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        type: "post",
        success: function (result) {
            var option = "";
            for (var i = 0; i < result.length; i++) {
                option += "<option value=" + result[i].tid + ">" + result[i].typename + "</option>";
            }
            $("select#type").append(option);
        },
        error: function (error) {
            layer.msg(error, {icon: 5});
        }

    })

    /*form表单获取后台传递的值*/
    $("#form1").ajaxForm(function (data) {
        if (data.success > 0) {
            layer.msg("添加成功",{icon: 1,time:1000});
        }else{
            layer.msg(data.error,{icon: 2,time:1000});
        }
    })
</script>
</body>
</html>
