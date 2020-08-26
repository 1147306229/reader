layui.use(['rate'], function () {
    var rate = layui.rate;

    //自定义文本
    rate.render({
        elem: '#test5'
        , value: 3
        , text: true
        , setText: function (value) { //自定义文本的回调
            var arrs = {
                '1': '极差'
                , '2': '差'
                , '3': '中等'
                , '4': '好'
                , '5': '极好'
            };
            this.span.text(arrs[value] || (value + "星"));
        }
    })

});

layui.use(['form', 'layer', 'jquery', 'element', 'laypage', 'form'], function () {
    var form = layui.form;
    window.layer = layui.layer;
    layedit = layui.layedit;
    window.jQuery = window.$ = layui.jquery;

    var element = layui.element,
        form = layui.form,
        laypage = layui.laypage;
    //删除用户
    $(document).on('click', '.del_comment', function () {
        var id = $(this).attr("data-id");
        layer.msg('删除成功', {icon: 1});
        $(this).closest('.comment').css("display", "none");
    });
});

layui.use('element', function () {
    var element = layui.element;

    //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
    var layid = location.hash.replace(/^#test1=/, '');
    element.tabChange('test1', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

    //监听Tab切换，以改变地址hash值
    element.on('tab(test1)', function () {
        location.hash = 'test1=' + this.getAttribute('lay-id');
    });
});