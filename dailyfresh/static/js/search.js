$(function () {

    // 为搜索按钮添加点击事件
    $('.input_btn').click(function (e) { 
        e.preventDefault();
        $.get("/search/", {"q":"果"},
            function (data, textStatus, jqXHR) {
                alert(data)
            },
            "text/html"
        );
        
    });

});