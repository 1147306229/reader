<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>流加载</title>
    <style>
        .flow-default{width: 600px; height: 400px; overflow: auto; font-size: 0;}
        .flow-default li{display: inline-block; margin: 0 5px; font-size: 14px; width: 48%;  margin-bottom: 10px; height: 100px; line-height: 100px; text-align: center; background-color: #eee;}
        .flow-default img{width: 100%; height: 100%;}
        .site-demo-flow{width: 600px; height: 300px; overflow: auto; text-align: center;}
        .site-demo-flow img{width: 40%; height: 200px; margin: 0 2px 5px 0; border: none;}
    </style>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>信息流 - 滚动加载</legend>
</fieldset>
<ul class="flow-default" id="LAY_demo1">

</ul>

<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>信息流 - 手工加载</legend>
</fieldset>
<ul class="flow-default" style="height: 300px;" id="LAY_demo2">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
</ul>--%>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>动态操作Tab</legend>
</fieldset>

<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="11">网站设置</li>
        <li lay-id="22">用户管理</li>
        <li lay-id="33">权限分配</li>
        <li lay-id="44">商品管理</li>
        <li lay-id="55">订单管理</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">内容1</div>
        <div class="layui-tab-item">内容2</div>
        <div class="layui-tab-item">内容3</div>
        <div class="layui-tab-item">内容4</div>
        <div class="layui-tab-item">内容5</div>
    </div>
</div>
<div class="site-demo-button" style="margin-bottom: 0;">
    <button class="layui-btn site-demo-active" data-type="tabAdd">新增Tab项</button>
    <button class="layui-btn site-demo-active" data-type="tabDelete">删除：商品管理</button>
    <button class="layui-btn site-demo-active" data-type="tabChange">切换到：用户管理</button>
</div>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>图片懒加载</legend>
</fieldset>
<div class="site-demo-flow" id="LAY_demo3">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i2/701696736/TB2PNl5ahQa61Bjy0FhXXaalFXa_!!701696736.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i2/162734861/TB2V5rsX_gc61BjSZFkXXcTkFXa_!!162734861.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i4/69476562/TB2htq4XTka61BjSszfXXXN8pXa_!!69476562.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i1/180558071/TB2sy6jXMQc61BjSZFGXXa1DFXa_!!180558071.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i2/701696736/TB2PNl5ahQa61Bjy0FhXXaalFXa_!!701696736.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i3/285892163/TB2qu2HX9Zb61BjSZPfXXaU.pXa_!!285892163.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i2/704998060/TB2S.gAXTgc61BjSZFkXXcTkFXa_!!704998060.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i3/117202952/TB25lckX_AX61Bjy0FcXXaSlFXa_!!117202952.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i2/162734861/TB2qijoX9Zb61BjSZPfXXaU.pXa_!!162734861.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i3/96216586/TB2S7EfXHMc61BjSZFFXXaDLFXa_!!96216586.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i8/TB1jSSFNFXXXXcoXFXXYXGcGpXX_M2.SS2_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i2/162734861/TB2ylbsX37c61BjSZFKXXb6hFXa_!!162734861.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i2/117202952/TB2FdyZajUd61BjSZPcXXc6hXXa_!!117202952.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i4/777105914/TB2t.qbXZwb61Bjy0FfXXXvlpXa_!!777105914.jpg_400x400q90.jpg?t=1494291277528">
    <img lay-src="https://gw.alicdn.com/bao/uploaded/i4/TB1XzupNFXXXXcpXXXXXXXXXXXX_!!0-item_pic.jpg_400x400q90.jpg?t=1494291277528">
</div>

<p style="margin-top: 20px;">
    无论滚动条上滑还是下滑，都只始终加载当前屏的图片（你可以快速拉动滚动条到中间区域，然后再往上滑动试试）
    <br>Layui的图片懒加载，除了对滚动条的性能进行了美好的优化，也对图片的“当前屏”进行了高效计算，无惧于任何规模庞大的图片数量！
</p>


<link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
<script src="<%=path%>/statics/layui/layui.js"></script>

<script>
    layui.use('flow', function(){
        var flow = layui.flow;

        flow.load({
            elem: '#LAY_demo1' //流加载容器
            ,scrollElem: '#LAY_demo1' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,done: function(page, next){ //执行下一页的回调
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                <%--$.get('<%=path%>/proclamation/findProByPage/page='+page, function(res){--%>
                <%--    //假设你的列表返回在data集合中--%>
                <%--    layui.each(res.data, function(index, item){--%>
                <%--        lis.push('<li>'+ item.title +'</li>');--%>
                <%--    });--%>
                     //模拟数据插入
                     setTimeout(function(){
                         var lis = [];
                         for(var i = 0; i < 8; i++){
                             lis.push('<li>'+ ( (page-1)*8 + i + 1 ) +'</li>')
                         }

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < 10); //假设总页数为 10
                }, 500);
            }
        });

        /*flow.load({
            elem: '#LAY_demo2' //流加载容器
            ,scrollElem: '#LAY_demo2' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,isAuto: false
            ,isLazyimg: true
            ,done: function(page, next){ //加载下一页
                //模拟插入
                setTimeout(function(){
                    var lis = [];
                    for(var i = 0; i < 6; i++){
                        lis.push('<li><img lay-src="http://s17.mogucdn.com/p2/161011/upload_279h87jbc9l0hkl54djjjh42dc7i1_800x480.jpg?v='+ ( (page-1)*6 + i + 1 ) +'"></li>')
                    }
                    next(lis.join(''), page < 6); //假设总页数为 6
                }, 500);
            }
        });*/

        //按屏加载图片
        flow.lazyimg({
            elem: '#LAY_demo3 img'
            ,scrollElem: '#LAY_demo3' //一般不用设置，此处只是演示需要。
        });
    });

    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });
</script>
</body>
</html>
