<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/statics/css/home.css">
</head>
<body>

<header id="header">
    <span class="layui-breadcrumb" lay-separator="|">
      <a href="">注册</a>
      <a href="">登录</a>
      <a href="">帮助</a>
      <a href="">客户端</a>
    </span>
</header>


<section id="section">
    <input type="hidden" id="hidden" value="<%=path%>">
    <%--<img src="<%=path%>/statics/image/logo.png" style="width:200px;height: 100px;position:absolute;top:-20px;left: 0px">--%>

    <input type="text" id="search">
    <div class="layui-btn layui-btn-danger">搜索</div>

    <ul class="popular">
        <li>热词:</li>
        <li>圣墟</li>
        <li>九爷夫人是大佬</li>
    </ul>

    <i class="layui-icon" style="position: absolute;right: 80px;top: 10px;font-size: 30px">&#xe618;</i>
        
    <img src="<%=path%>/statics/image/tx.png" style="position: absolute;right: 2px;top: 0px">
        
    <span class="layui-breadcrumb" lay-separator="|">
      <a href="">娱乐</a>
      <a href="">八卦</a>
      <a href="">体育</a>
      <a href="">搞笑</a>
      <a href="">视频</a>
      <a href="">游戏</a>
      <a href="">综艺</a>
   </span>
    <div class="layui-carousel" id="test1">
        <div carousel-item>
            <div><img src="../../statics/image/0.jpg"></div>
            <div><img src="../../statics/image/1.jpg"></div>
            <div><img src="../../statics/image/2.jpg"></div>
            <div><img src="../../statics/image/3.jpg"></div>
            <div><img src="../../statics/image/4.jpg"></div>
        </div>
    </div>

    <div id="proclamation">
        <h3>公告</h3>
        <ul></ul>
    </div>


    <blockquote class="layui-elem-quote">男生频道</blockquote>
    <div id="showManBook">
        <div class="layui-tab" lay-filter="test01">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="1">最新上架</li>
                <li lay-id="2">本周强推</li>
                <li lay-id="3">编辑推荐</li>
                <li lay-id="4">完本精品</li>
                <li lay-id="5">限时免费</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show"></div>
                <div class="layui-tab-item"></div>
                <div class="layui-tab-item"></div>
                <div class="layui-tab-item"></div>
                <div class="layui-tab-item"></div>
            </div>
        </div>
    </div>
    <blockquote class="layui-elem-quote">女生频道</blockquote>
    <div id="showWomanBook">
        <div class="layui-tab" lay-filter="test02">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="1">最新上架</li>
                <li lay-id="2">本周强推</li>
                <li lay-id="3">编辑推荐</li>
                <li lay-id="4">完本精品</li>
                <li lay-id="5">限时免费</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show"></div>
                <div class="layui-tab-item"></div>
                <div class="layui-tab-item"></div>
                <div class="layui-tab-item"></div>
                <div class="layui-tab-item"></div>
            </div>
        </div>
    </div>
</section>

<footer>
    <script src="../../statics/js/jquery-1.12.4.min.js"></script>
    <script src="../../statics/js/home.js"></script>
    <link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
    <script src="<%=path%>/statics/layui/layui.js"></script>
    <script src="<%=path%>/statics/layui/layui.all.js"></script>
    <script src="../../statics/js/layUiHome.js"></script>
</footer>
</body>
</html>
