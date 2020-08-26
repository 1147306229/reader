<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<html>
<head>
    <title>${book.bookname}</title>
    <link rel="stylesheet" href="<%=path%>/statics/css/chapter.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/home.css">
    <link rel="stylesheet" href="<%=path%>/statics/layui/css/layui.css"/>
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
    <%-- <img src="<%=path%>/statics/image/" style="width:200px;height: 100px;position:absolute;top:-20px;left: 0px">--%>

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
    <a href="<%=path%>/">首页</a>

    <div class="books">
        <ul>
            <li><img src="<%=path%>/statics/image/${book.bpath}"></li>
            <li>
                <h2>${book.bookname}</h2>
                <span class="author">作者：${book.user.unickname}</span><br><br>
                <span class="type">${book.type.typename}</span>
                <c:if test="${book.bsign==0}"></c:if>
                <c:if test="${book.bsign==1}">
                    <span class="sign">签约</span>
                </c:if>

                <c:if test="${book.bisfree==0}">
                    <span class="free">免费</span>
                </c:if>
                <c:if test="${book.bisfree==1}">
                    <span class="vip">VIP</span>
                </c:if>

                <c:if test="${book.bstatus==0}">
                    <span class="load">连载中</span>
                </c:if>
                <c:if test="${book.bstatus==1}">
                    <span class="end">已完结</span>
                </c:if>

                <p>
                    ${book.bdetail}
                </p>
                <div class="layui-btn layui-btn-danger">免费试读</div>
                <div class="layui-btn layui-btn-primary">加入书架</div>

            </li>
        </ul>
    </div>
    <div class="author" style="border:1px solid red;width: 30%;height: 320px;position: absolute;top:146px;right:0px">
        作家信息
    </div>
    <div class="layui-tab" lay-filter="test1">
        <ul class="layui-tab-title">
            <li class="layui-this" lay-id="1"><h3>作品信息</h3></li>
            <li lay-id="2" onclick="chapter()"><h3>目录</h3></li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <p id="detail">
                    ${book.bdetail}
                </p>
                <hr>
                <div class="comment_list">
                    <h2>全部评论</h2>
                </div>
            </div>
            <div class="layui-tab-item"></div>
        </div>
    </div>
</section>

<%--<div id="test5"></div>--%>


<script src="<%=path%>/statics/layui/layui.js"></script>
<script src="<%=path%>/statics/js/layUiCheapter.js"></script>

<script src="../../statics/js/jquery-1.12.4.min.js"></script>
<script>

    /*查看章节内容*/
    function a(schapter) {
        window.location = "<%=path%>/select/findSelectArticleById/" + schapter + "/" +${book.bid};
    }

    $(function () {

        var p = $("p#detail").text();
        $("p#detail").html(p.replace(/。/g, "。<br>"));


        if (${book.bisfree==1}) {
            $(".layui-tab-item .ulChapter li a").attr("disabled", true).css({
                "pointer-events": "none",
                "color": "gray"
            });
            ;
        }

        comment();

        chapter();


    })

    /*评论的显示*/
    var comment = function comment() {
        $.ajax({
            url: "<%=path%>/comment/queryCommentById/" +${book.bid},
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            type: "post",
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    var show = " <hr>" +
                        "<div class='comment'>" +
                        "<div class='imgdiv'>" +
                        "<img class='imgcss'" +
                        "src='<%=path%>/statics/image/" +
                        result[i].user.uavatar +
                        "'/>" +
                        "</div>" +
                        "<div class='conmment_details'>" +
                        "<span class='comment_name'>" +
                        result[i].user.unickname +
                        " </span>" +
                        "<span>" +
                        new Date(result[i].cdate).toLocaleString() +
                        "</span>" +
                        "<div class='comment_content'>" +
                        result[i].content +
                        "<i class='layui-icon layui-icon-praise' onclick='addClikes(" +
                        (i + 1) +
                        "," +
                        result[i].clikes +
                        ")'>" +
                        result[i].clikes +
                        "</i>" +
                        "<i class='layui-icon layui-icon-tread' onclick='addCulikes(" +
                        (i + 1) +
                        "," +
                        result[i].culikes +
                        ")'>" +
                        result[i].culikes +
                        "</i>" +
                        "</div>" +
                        "</div>";
                    $(".comment_list").append(show);
                }

                var shows = "";
                if (result == "") {
                    shows = "<hr><div class='comment_add_or_last'>" +
                        "暂无评论" +
                        "</div>";
                    $(".comment_list").append(shows);
                } else {
                    shows = "<hr><div class='comment_add_or_last'>" +
                        "没有更多评论了" +
                        "</div>";
                    $(".comment_list").append(shows);
                }

            },
            error: function (error) {
                layer.msg(error, {icon: 5});
            }

        })

    }
    /*章节的显示*/
    var chapter = function chapter() {
        $(".layui-tab-item h3").remove();
        $(".layui-tab-item .ulChapter").remove();
        var show = "";
        $.ajax({
            url: "<%=path%>/select/findChByTit/" +${book.bid},
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            type: "post",
            success: function (result) {
                show = "<h3>正文卷 共" +
                    result.length +
                    "章</h3>" +
                    " <ul class='ulChapter'>" +
                    "</ul>";
                $(".layui-tab-content .layui-tab-item:nth-child(2)").append(show);

                for (var i = 0; i < result.length; i++) {
                    show = "<li>" +
                        "<a onclick='a(" +
                        result[i].schapter +
                        ")'>" +
                        result[i].stitle +
                        "</a>" +
                        "</li>";
                    $(".layui-tab-item .ulChapter").append(show);
                    if (i == result.length - 1) {

                        if (result.length % 3 != 0 && (result.length + 2) % 3 == 0) {/*第一种情况一行只有一个章节*/
                            show = "<li style='border-bottom: 1px solid #e2e2e2;width: 66.8%;height:40px'></li>"
                            $(".layui-tab-item .ulChapter").append(show);
                        } else if (result.length % 3 != 0 && (result.length + 1) % 3 == 0) {/*第二种情况一行只有两个章节*/
                            show = "<li style='border-bottom: 1px solid #e2e2e2;width: 33.7%;height:40px'></li>"
                            $(".layui-tab-item .ulChapter").append(show);
                        }


                    }
                }

            },
            error: function (error) {
                layer.msg(error, {icon: 5});
            }

        })
    }

    var num = 0;
    var unum = 0;
    var addClikes = function addClikes(cid, clikes) {
        /*需要使用order by*/
        // var clikes = $("i.layui-icon.layui-icon-praise:nth-child(" + cid + ")").html();
        alert(clikes)
        num = clikes + 1;

        /*$.get("</%=path%>/comment/", function (res) {
            $()
        })*/
    }


    var addCulikes = function addCulikes(cid,culikes) {

        // var culikes = $("i.layui-icon.layui-icon-tread").html();
        unum += parseInt(culikes) + 1;
        // var s=$("div.comment_content:nth-child("
        //     +cid+") i").html();

    }


</script>

</body>
</html>
