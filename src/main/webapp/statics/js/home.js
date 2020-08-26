$(function () {

    var path=$("#hidden").val();

    $.ajax({
        url: path+"/book/findByIndex",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        type: "post",
        success: function (result) {
            var hr = " <hr class='layui-bg-gray'>";
            for (var i = 0; i < result.length; i++) {
                if (i == 4) {
                    $(".layui-tab-item ul").append(hr);
                }

                var show = "<ul class='ul'>" +
                    "<li>" +
                    "<img src='" +path+
                    "/statics/image/" +
                    result[i].bpath +
                    "'>" +
                    "</li>" +
                    "<li>" +
                    "<h4><a href='" +path+
                    "/book/findById/" +
                    result[i].bid+
                    "'>" +
                    result[i].bookname +
                    "</a></h4>" +
                    "<p>" +
                    result[i].bdetail +
                    "</p>" +
                    "<i class='layui-icon'>&#xe66f;&nbsp;" +
                    "<span>" +
                    result[i].user.unickname +
                    "</span>" +
                    "</i>" +
                    "</li>" +
                    "</ul>";
                $(".layui-tab-item.layui-show").append(show);
            }
        },
        error:function (error) {
            layer.msg(error, {icon: 5});
        }

    })

    $.ajax({
        url: path+"/book/findByIndex",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        type: "post",
        success: function (result) {
            for (var i = 0; i < result.length; i++) {
                var show = "<ul class='ul'>" +
                    "<li>" +
                    "<img src=" +path+
                    "'/statics/image/" +
                    result[i].bpath +
                    "'>" +
                    "</li>" +
                    "<li>" +
                    "<h4><a href='" +path+
                    "/book/findById/" +
                    result[i].bid+
                    "'>" +
                    result[i].bookname +
                    "</a></h4>" +
                    "<p>" +
                    result[i].bdetail +
                    "</p>" +
                    "<i class='layui-icon'>&#xe66f;&nbsp;" +
                    "<span>" +
                    result[i].user.unickname +
                    "</span>" +
                    "</i>" +
                    "</li>" +
                    "</ul>";
                $(".showWomanBook .layui-tab-content div:first-child ").append(show);
            }
        },
        error:function (error) {
            layer.msg(error, {icon: 5});
        }

    })

    //显示公告栏
    $.ajax({
        url: path+"/proclamation/findPro",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        type: "post",
        success: function (result) {

            var total = "";
            for (var i = 0; i < result.length; i++) {

                var show = "<li>"
                    + result[i].ptitle +
                    "</li>";
                total += show;
            }
            $("#proclamation ul").append(total);
        },error:function (error) {
            layer.msg(error, {icon: 5});
        }
    })


})

