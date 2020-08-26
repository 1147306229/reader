<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍信息</title>
</head>
<link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
<body>
<form class="layui-form" action="<%=path%>/book/updateBook" id="form1" target="nm_iframe">
    <input type="hidden" name="bid" value="${book.bid}">
    <div class="layui-form-item" style="margin-top: 20px">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" name="bookname" autocomplete="off" placeholder="请输入书名"
                   value="${book.bookname}"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline" style="margin-right: 20px">
            <label class="layui-form-label">作者</label>
            <div class="layui-input-block">
                <input type="text" name="user.unickname" lay-verify="required" autocomplete="off" class="layui-input"
                       readonly="readonly" value="${book.user.unickname}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">签约</label>
            <div class="layui-input-inline">
                <select lay-verify="required" lay-search="" name="bsign" disabled="disabled" >
                    <option value="0" <c:if test="${book.bsign=='0'}">selected="selected"</c:if>>未签约</option>
                    <option value="1" <c:if test="${book.bsign=='1'}">selected="selected"</c:if>>已签约</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-inline">
                <select id="type" lay-verify="required" lay-search="" name="tid">
                    <option value="0">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select id="bstatus" lay-verify="required" lay-search="" name="bstatus">
                    <option value="-1">请选择</option>
                    <option value="0" <c:if test="${book.bisfree=='0'}">selected="selected"</c:if>>未完结</option>
                    <option value="1" <c:if test="${book.bisfree=='1'}">selected="selected"</c:if>>已完结</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">月票数</label>
            <div class="layui-input-block">
                <input type="text" name="bmpass" autocomplete="off" readonly="readonly"
                       value="${book.bmpass}"
                       class="layui-input">
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">热度</label>
            <div class="layui-input-inline">
                <input type="text" name="bhot" lay-verify="required|number" autocomplete="off" class="layui-input"
                       value="${book.bhot}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">创建日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test5" name="bcreatdate" placeholder="yyyy-MM-dd HH:mm:ss"
                       value=" <fmt:formatDate value="${book.bcreatdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>">
            </div>

        </div>
        <div class="layui-inline">
            <label class="layui-form-label">是否免费</label>
            <div class="layui-input-inline">
                <select id="bisfree" lay-verify="required" lay-search="" name="bisfree">
                    <option value="-1">请选择</option>
                    <option value="0" <c:if test="${book.bisfree=='0'}">selected="selected"</c:if>>免费</option>
                    <option value="1" <c:if test="${book.bisfree=='1'}">selected="selected"</c:if>>付费</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item" style="margin-bottom: 20px">
        <label class="layui-form-label">详细内容</label>
        <div class="layui-inline" style="width: 50%">
            <textarea placeholder="请输入详细内容" class="layui-textarea" id="bdetail" name="bdetail" style="width: 109%">
                ${book.bdetail}
            </textarea>
        </div>
    </div>

    <div class="layui-input-block">
        <button class="layui-btn" lay-submit="" lay-filter="demo1">修改</button>
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
            var num =${book.type.tid};
            $("select#type option[value='" + num + "']").attr("selected", "selected");/*状态默认被选中*/
        },
        error: function (error) {
            layer.msg(error, {icon: 5});
        }

    })

    /*form表单获取后台传递的值*/
    $("#form1").ajaxForm(function (data) {
        if (data.success > 0) {
            layer.msg("修改成功", {icon: 1, time: 1000});
        } else {
            layer.msg(data.error, {icon: 2, time: 1000});
        }
    })
</script>
</body>
</html>
