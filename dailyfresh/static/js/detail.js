$(function () {

    $('.add').click(function (e) { 
        e.preventDefault();
        $('.num_show').val(parseInt($('.num_show').val()) + 1)
        calculate_fee()
    });

    $('.minus').click(function (e) { 
        e.preventDefault();
        var cur_num = $('.num_show').val()
        if ('1' != cur_num) {
            $('.num_show').val(parseInt($('.num_show').val()) - 1)
            calculate_fee()
        }
    });

    // 立即购买点击事件
    $('#buy_now, #add_cart').click(function (e) { 
        e.preventDefault();
        add2cart($(this).attr('id'))
    });


    /**
     * 数量变化时计算费用
     */
    function calculate_fee() {
        var price = parseFloat($('.show_pirze em').text())
        var goods_num = parseInt($('.num_show').val())
        $('.total em').text((price * goods_num).toFixed(2) + "元")
    }

    function add2cart(btn_id) {
        var goods_id = $('#goods_id').text()
        var count = $('.num_show').val()
        if ("buy_now" == btn_id) { // 如果是现在购买按钮, 跳到购物车页面
            var link = "/cart/add2cart/" + goods_id + "/" + count + "/"
            window.location.href = link
        } else {
            $.ajax({
                url: "/cart/add2cart/" + goods_id + "/" + count + "/",
                dataType: "json",
                success: function (response) {
                    
                }
            });
        }
    }
});