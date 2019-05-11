$(function () {

    $('.add').click(function (e) { 
        e.preventDefault()
        var $input_select = $(this).siblings('input:first')
        $input_select.val(parseInt($input_select.val()) + 1)
        calculate_fee(this)
    });

    $('.minus').click(function (e) { 
        e.preventDefault();
        var $input_select = $(this).siblings('input:first')
        var cur_num = $input_select.val()
        if ('1' != cur_num) {
            $input_select.val(parseInt($input_select.val()) - 1)
            calculate_fee(this)
        }
    });

    /**
     * 数量变化时计算费用
     */
    function calculate_fee(th) {
        var price = parseFloat($(th).parents('ul').find('.col05 em').text())
        var goods_num = parseInt($(th).siblings('input.num_show').val())
        $(th).parents('ul').find('.col07').text((price * goods_num).toFixed(2) + "元")
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
                    alert('ok')
                }
            });
        }
    }
});