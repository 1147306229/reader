<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>星悦小说后台管理</title>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">星悦小说后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="https://pic.feizl.com/upload2007/allimg/190614/223531A33-0.jpg" class="layui-nav-img">
                    山海不可及
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                    <dd><a href="">退出登录</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href=""></a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="">所有数据</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="#" data-url="<%=path%>/bookList.jsp" data-title="书籍信息" data-id="11"
                               class="site-demo-active"
                               data-type="tabAdd">书籍信息</a>
                        </dd>
                        <dd>
                            <a href="#" data-url="<%=path%>/userList.jsp" data-title="用户信息" data-id="22"
                               class="site-demo-active"
                               data-type="tabAdd">用户信息</a>
                        </dd>
                        <dd>
                            <a href="#" data-url="<%=path%>/error.jsp" data-title="章节信息" data-id="33" class="site-demo-active"
                               data-type="tabAdd">章节信息</a>
                        </dd>
                        <dd>
                            <a href="#" data-url="<%=path%>/commentList.jsp" data-title="评论信息" data-id="44" class="site-demo-active"
                               data-type="tabAdd">评论信息</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;margin-top: -10px">
            <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="display: none">
                <ul class="layui-tab-title"></ul>
                <div class="layui-tab-content"></div>
            </div>

        </div>

    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
</body>
<script src="<%=path%>/statics/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
<script src="<%=path%>/statics/layui/layui.js"></script>
<script>
    //tab切换
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function (url, id, name) {
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe scrolling="auto" frameborder="0" src="<%=path%>' + url + '" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                });
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            }
            , tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
        };

        /*点击tab事件*/
        $(".layui-tab").on("click", function (e) {
            /*tab关闭事件*/
            if ($(e.target).is(".layui-tab-close")) {
                /*判断是否还有tab*/
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    $(".layui-tab").hide();
                }
                // console.log($(e.target).parent().attr("lay-id"))// 输出哪个tab被点击，没有值时返回undefined
            }
        })

        function FrameWH() {
            var h = $(window).height();
            $("iframe").css("height", h + "px");
        }

        /*点击左侧导航右侧显示*/
        $('.site-demo-active').on('click', function () {
            $(".layui-tab").show();
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在
                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });

    });

</script>
</html>
