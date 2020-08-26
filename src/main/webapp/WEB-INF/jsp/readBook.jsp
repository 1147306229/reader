<%--
  Created by IntelliJ IDEA.
  User: 11473
  Date: 2020/7/13
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<html>
<head>
    <title id="title"></title>
    <link rel="stylesheet" href="<%=path%>/statics/css/readBook.css">
</head>
<body>


<div id="content">
    <h4></h4>
    <p id="p">
    </p>
</div>

<link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
<script src="<%=path%>/statics/layui/layui.js"></script>
<script src="<%=path%>/statics/js/jquery-1.12.4.min.js"></script>
<script>
    layui.use('flow', function () {
        var flow = layui.flow;
        var num=0;
        flow.load({
            elem: '#content' //流加载容器
            , done: function (page, next) { //执行下一页的回调
                var lis = [];
                var p = "";

                if(num>0){
                    page+=${schapter}-1;
                }
                if(page<${schapter}){
                    num++;
                    page+=${schapter}-1;
                }

                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('<%=path%>/select/findSelectContent/' + page + '/' +${bid} +'/'+${schapter}, function (res) {
                    //假设你的列表返回在data集合中
                    layui.each(res.list, function (index, item) {
                        $("#title").html(item.stitle);
                        p=item.scontent;
                        p = p.replace(/。\s/g,'。<br>&nbsp;&nbsp;');
                        p = p.replace(/。”/g,'。”<br>');
                        p = p.replace(/！”/g,'！”<br>');
                        p = p.replace(/？”/g,'？”<br>');
                        p = p.replace(/...”\s/g,'...”<br>');
                        // p = p.replace(/...\s/g,'...<br>');
                        lis.push("<h3>" + item.stitle + "</h3>" +
                            "<p id='p'>" + p + "</p>");
                    });

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.total);
                });
            }
        });

    });
</script>

</body>
</html>
