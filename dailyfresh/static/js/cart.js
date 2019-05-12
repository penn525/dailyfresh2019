$(function () {
    
    // 初始化页面, 计算费用
    calculate_init() 

    // 点击加号, 数量加一
    $('.add').click(function (e) { 
        var $input_select = $(this).siblings('input:first')
        $input_select.val(parseInt($input_select.val()) + 1)
        calculate_fee($(this).parents('ul'))
        total_fee()
        edit($(this).next())
    });

    // 点击减号, 数量减一
    $('.minus').click(function (e) { 
        e.preventDefault();
        var $input_select = $(this).siblings('input:first')
        var cur_num = $input_select.val()
        if ('1' != cur_num) {
            $input_select.val(parseInt($input_select.val()) - 1)
            calculate_fee($(this).parents('ul'))
            total_fee()
            edit($(this).prev())
        }
    });

    /**
     * 数量变化时:
     * 1, 计算改商品总的费用
     * 2, 发送ajax请求, 返回的是总数量
     * 3, 计算所有商品总得费用
     */
    $('.num_show').change(function (e) { 
        e.preventDefault();
        calculate_fee($(this).parents('ul.cart_list_td'))
        edit(this)
        total_fee()
    });


    $('.col08').click(function (e) { 
        e.preventDefault();
        del_goods($(this).parents('ul'))
    }); 

    /**
     * 计算总费用
     */
    function total_fee() {
        var total = 0.00
        $.each($('li.col07 em'), function(indexInArray, valueOfElement) {
            total = total + parseFloat($(valueOfElement).text())
        });
        $('#total_fee').text(total.toFixed(2))
    }

    /**
     * 计算一项商品的费用
     * @param {ul} ul_ele 
     */
    function calculate_fee(ul_ele) {
        var price = parseFloat($(ul_ele).find('.col05 em').text())
        var count = parseInt($(ul_ele).find('input.num_show').val())
        var total_fee = (price * count).toFixed(2)
        $(ul_ele).find('.col07 em').text(total_fee)
    }

    /**
     * 初始化页面时, 计算费用
     */
    function calculate_init() {
        $.each($('ul.cart_list_td'), function (indexInArray, element) { 
            calculate_fee(element)
        });
        total_fee()
    }

    /**
     * 删除选中的商品
     * @param {*} ul_element 
     */
    function del_goods(ul_element) {
        var gid = $(ul_element).find('#goods_id').text()
        $.ajax({
            url: "/cart/delete/" + gid + "/",
            dataType: "json",
            success: function (response) {
                $(ul_element).remove()
                $('.count').each(function(inedx) { 
                    $(this).text(response.count)
                 })
                total_fee()
            }
        });
    }

    /**
     * 修改购物车商品数量
     * @param {x} input_element input输入框
     */
    function edit(input_element) {
        var gid = $(input_element).parents('ul').find('#goods_id').text()
        var count = $(input_element).val()
        $.ajax({
            url: "/cart/edit/" + gid + "/" + count + "/",
            dataType: "json",
            success: function (response) {
 
            }
        });
    }



});