<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>后台数据显示</title>
</head>
<body>
<div class="demoTable">
    搜索ID：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
<script src="<%=path%>/statics/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
<script src="<%=path%>/statics/layui/layui.js"></script>
<script>
    //数据表格的显示
    layui.use('table', function () {
        var table = layui.table;

        //温馨提示：默认由前端自动合计当前行数据。从 layui 2.5.6 开始： 若接口直接返回了合计行数据，则优先读取接口合计行数据。
        //详见：https://www.layui.com/doc/modules/table.html#totalRow
        table.render({
            elem: '#test'
            , url: '<%=path%>/users/query'
            , toolbar: '#toolbarDemo'
            , title: '用户信息表'
            , limit: 9
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {title: '序号', width: 80, fixed: 'left', sort: true, align: 'center', type: 'numbers'}
                , {field: 'uid', title: 'ID', width: 80, fixed: 'left', unresize: true, sort: true, align: 'center'}
                , {field: 'username', title: '用户名', width: 120, edit: 'text', align: 'center'}
                , {field: 'upassword', title: '密码', width: 162, edit: 'text', align: 'center'}
                , {field: 'ugender', title: '性别', width: 80, edit: 'text', align: 'center'}
                , {field: 'unickname', title: '昵称', width: 120, edit: 'text', align: 'center'}
                , {field: 'ucreatdate', title: '创建日期', width: 170, align: 'center'}
                , {field: 'umpass', title: '月票数', width: 100, edit: 'text', align: 'center'}
                , {field: 'uavatar', title: '图片', width: 128, edit: 'text', align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 200, align: 'center'}
            ]]
            , page: true
        });


        //监听头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据

            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    if (data == "") {
                        layer.msg("暂未选中数据");
                    } else {
                        layer.alert(JSON.stringify(data));
                    }
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选')
                    break;
            }
            ;

        });

        //操作
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'detail') {
                layer.msg('查看操作');
            } else if (layEvent === 'del') {
                layer.confirm('确定删除书籍' + data.bookname + "吗？", {icon: 3, title: '提示信息'}, function (index) {
                    //向服务端发送删除指令
                    $.get("<%=path%>/book/delBookById/" + data.bid, function (res) {
                        if (res.success > 0) {
                            layer.msg("删除成功", {icon: 1});
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);
                            var num = $(".layui-laypage-count").html().substr(2, 2) - 1;
                            $(".layui-laypage-count").text("共 " + num + " 条");
                        } else {
                            layer.msg(res.result, {icon: 2});
                        }
                    })

                });
            } else if (layEvent === 'edit') {
                layer.msg('编辑操作');
            }
        });
    });
</script>
</html>
