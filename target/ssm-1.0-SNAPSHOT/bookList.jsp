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
    <div class="layui-btn-container demoTable">
        <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-circle-fine"
                                                                  style="font-size:20px;font-weight:bold"></i> 新增书籍
        </button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-filter="batchDel" lay-event="delAll"
                data-type="getCheckData"><i class="layui-icon layui-icon-delete" style="font-size:20px;"></i> 批量删除
        </button>
        <button type="button" class="layui-btn layui-btn-sm" id="refresh">刷新</button>
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
    layui.use(['table', 'jquery'], function () {
        var table = layui.table;
        var $ = layui.jquery;
        //刷新当前的页面
        $(document).on('click', "#refresh", function () {
            location.reload();
        })

        //温馨提示：默认由前端自动合计当前行数据。从 layui 2.5.6 开始： 若接口直接返回了合计行数据，则优先读取接口合计行数据。
        //详见：https://www.layui.com/doc/modules/table.html#totalRow
        table.render({
            id: 'bookList'
            , elem: '#test'
            , url: '<%=path%>/book/query'
            , toolbar: '#toolbarDemo'
            , title: '书籍信息表'
            , limit: 10
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', type: 'numbers', title: 'ID', width: 40, fixed: 'left'}
                // , {field: 'bid', title: '序号', width: 80, fixed: 'left', unresize: true, sort: true, align: 'center'}
                , {field: 'bookname', title: '书名', width: 115, edit: 'text', align: 'center'}
                , {title: '作者', width: 120, edit: 'text', align: 'center', templet: '<div>{{d.user.unickname}}</div>'}
                , {title: '类型', width: 120, edit: 'text', align: 'center', templet: '<div>{{d.type.typename}}</div>'}
                , {field: 'bdetail', title: '内容介绍', width: 200, align: 'center'}
                , {field: 'bcreatdate', title: '创建日期', width: 160, align: 'center'}
                , {field: 'bhot', title: '热度', width: 80, edit: 'text', align: 'center'}
                , {field: 'bmpass', title: '月票数', width: 80, edit: 'text', align: 'center'}
                , {field: 'bstatus', title: '状态', width: 80, edit: 'text', align: 'center', templet: function (res) {
                        if (res.bstatus == '1') {
                            return '<span style="color:#FF5722">已完结</span>';
                        } else {
                            return '<span style="color:#3E8AF4">未完结</span>';
                        }

                    }
                }
                , {field: 'bisfree', title: '是否免费', width: 135, edit: 'text', align: 'center', templet: function (res) {
                        if (res.bisfree == '1') {
                            return '<span style="color:#FF5722">付费</span>';
                        } else {
                            return '<span style="color:#3E8AF4">免费</span>';
                        }
                    }
                }, {field: 'bsign', title: '是否签约', width: 135, edit: 'text', align: 'center', templet: function (res) {
                        if (res.bsign == '1') {
                            return '<span style="color:#FF5722">已签约</span>';
                        } else {
                            return '<span style="color:#3E8AF4">未签约</span>';
                        }
                    }
                }
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 170, align: 'center'}
            ]]
            , page: true
            // , done: function () {
            //     $("[data-field='bid']").css('display', 'none');//隐藏这一列
            // }
        });


        //监听头工具栏事件
        var arr = [];
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据

            for (var i = 0; i < arr.length + 1; i++) {//第一次
                if (array.length == 0) {//第二次清空为[],未选择数据
                    data = "";
                }
            }
            var Aevent = obj.event;
            var ids = [];//书籍id
            for (var i = 0; i < data.length; i++) {
                ids.push(data[i].bid);
            }

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
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
                case 'add':
                    var index = layer.open({
                        type: 2,
                        shadeClose: true,
                        title: '添加书籍信息',
                        content: '<%=path%>/book/add',
                        area: ['800px', '600px'],
                        maxmin: true,
                        cancel: function () {//关闭后刷新
                            location.reload();
                        }
                    })
                    layer.full(index);
                    break;
                case 'delAll':
                    if (data == "") {
                        layer.msg("请先选择批量删除的书籍", {time: 2000, icon: 5});
                    } else {
                        layer.confirm("确认删除所选中的书籍吗？", {icon: 3, title: '提示信息'}, function (index) {
                            $.ajax({
                                url: "<%=path%>/book/deleteAll/" + ids,
                                contentType: "application/json;charset=UTF-8",
                                dataType: "json",
                                type: "post",
                                success: function (result) {
                                    if (result.success <= 0) {
                                        layer.msg('删除失败！', {icon: 5, offset: "auto", time: 2000});
                                    } else {
                                        for (var i = 0; i < array.length; i++) {
                                            $(array[i].selector).remove();
                                        }
                                        arr = array;
                                        array = [];
                                        var num = $(".layui-laypage-count").html().substr(2, 2) - result.success;
                                        $(".layui-laypage-count").text("共 " + num + " 条");
                                        layer.msg('删除成功', {icon: 1, offset: "auto", time: 2000});
                                    }
                                },
                                error: function (error) {
                                    layer.msg(error, {icon: 5});
                                }

                            })
                        });
                        break;
                    };
            }
        });

        var array = [];
        //复选框选中
        table.on('checkbox(test)', function (obj) {
            // console.log(obj.tr) //得到当前行元素对象
            var tr = obj.tr; //得到当前点击复选框的行元素对象
            if (obj.type == 'all') { //点击全选按钮触发此处
                var len = array.length;
                array.splice(0, len); //全选后删除数组项，重新添加全选的dom元素
                array.push(obj.tr.prevObject[0]);
            } else {
                if (obj.checked) { //多选框被选中则添加dom元素到数组
                    array.push(tr);
                } else {//取消多选框的选中则在数组中删除自己
                    var indexs = obj.tr[0].rowIndex;  //获取取消选中的元素对象下标
                    array.forEach((item, index) => {
                        //当数组中任意一个元素的rowIndex值与取消复选框的元素对象属性rowIndex的下标值相等，则在数组中删除该元素
                        if (item[0].rowIndex == indexs) {
                            array.splice(index, 1);
                        }
                    })
                }
            }
        })

        //表格操作
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
                var index = layer.open({
                    type: 2,
                    shadeClose: true,
                    title: '修改书籍信息',
                    content: '<%=path%>/book/updateB/' + data.bid,
                    area: ['800px', '600px'],
                    maxmin: true,
                    cancel: function () {//关闭后刷新
                        location.reload();
                    }
                })
                layer.full(index);
            }
        });

    });


</script>
</html>
