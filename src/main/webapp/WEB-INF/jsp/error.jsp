<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>富文本编辑器</title>
</head>
<link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
<body>
${exception.message}
<div class="layui-inline">
    <label class="layui-form-label">日期时间选择器</label>
    <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test5" placeholder="yyyy-MM-dd HH:mm:ss">
    </div>
</div>
<script src="<%=path%>/statics/layui/layui.js"></script>
<script>
    layui.use( 'laydate', function(){
        var laydate = layui.laydate;

        //日期时间选择器
        laydate.render({
            elem: '#test5'
            ,type: 'datetime'
        });


    });
</script>

</body>
</html>
