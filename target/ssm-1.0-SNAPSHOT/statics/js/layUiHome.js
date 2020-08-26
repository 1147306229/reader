layui.use(['carousel', 'element'], function () {
    var carousel = layui.carousel;
    //建造实例
    carousel.render({
        elem: '#test1'
        , width: '68%' //设置容器宽度
        , arrow: 'always' //始终显示箭头
        , autoplay: true
        , interval: 2000
    });

});
layui.use('element', function(){
    var element = layui.element;

    //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
    var layid = location.hash.replace(/^#test01=/, '');
    element.tabChange('test01', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

    //监听Tab切换，以改变地址hash值
    element.on('tab(test01)', function(){
        location.hash = 'test01='+ this.getAttribute('lay-id');
    });
});

layui.use('element', function(){
    var element = layui.element;

    //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
    var layid = location.hash.replace(/^#test02=/, '');
    element.tabChange('test02', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

    //监听Tab切换，以改变地址hash值
    element.on('tab(test02)', function(){
        location.hash = 'test02='+ this.getAttribute('lay-id');
    });
});