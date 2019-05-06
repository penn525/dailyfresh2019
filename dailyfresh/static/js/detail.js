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

    /**
     * 数量变化时计算费用
     */
    function calculate_fee() {
        var price = parseFloat($('.show_pirze em').text())
        var goods_num = parseInt($('.num_show').val())
        $('.total em').text((price * goods_num).toFixed(2) + "元")
    }
});