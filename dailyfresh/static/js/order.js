$(function () {

    order_init()

    $('#order_btn').click(function() {
        cart_ids = []
        // 选择购买的商品cart id
        $('.goods_list_td').each(function (index, element) {
            // element == this
            cart_ids.push(parseInt($(element).attr('cart_id')))
        });
        // alert(cart_ids)
        if (cart_ids.length == 0) { return }
        // csrf
        csrf = $.cookie('csrftoken')
        // total
        total = parseFloat($('#total_pay > b').text())
        params = {'total': total, 'cart_ids': cart_ids, 'csrfmiddlewaretoken': csrf}
    
        $.post({
            url: "/order/handle/", 
            data: params,
            traditional:true, // 不做深入序列化
            success: function (data, textStatus, jqXHR) {
                // 1. 库存不足, 返回购物车页面
                if (data.res == 1) {
                    alert(data.msg)
                    window.location.href = '/cart/'
                } else if(data.res == 2){
                    alert(data.msg)
                } else {
                    // alert(data.msg)
                    localStorage.setItem('order_finish', 2);
                    $('.popup_con').fadeIn('fast', function () { 

                        setTimeout(() => {
                            $('.popup_con').fadeOut('fast', function () { 
                                window.location.href = '/order/detail/'
                             });
                        }, 3000);
                        
                     });
                    
                }
            },
            dataType: "json"
        });
        
        return

        // localStorage.setItem('order_finish',2);

        // $('.popup_con').fadeIn('fast', function() {

        //     setTimeout(function(){
        //         $('.popup_con').fadeOut('fast',function(){
        //             window.location.href = 'index.html';
        //         });	
        //     },3000)
            
        // });
    });

    /**
     * 页面初始化
     * 1, 计算小计
     * 2, 计算总金额
     * 3, 计算实付款
     */
    function order_init() {
        // 1, 计算小计
        $('li.col07').each(function (index, element) {
            // element == this
            price = parseFloat($(element).siblings('.col05').text())
            count = parseInt($(element).siblings('.col06').text())
            $(element).children('b').text((price * count).toFixed(2))
        });

        // 2. 计算总金额
        total = 0.00
        $('.col07 > b').each(function (index, element) {
            // element == this
            total += parseFloat($(element).text())
        });
        $('#total_goods_count > b').text(total)
        
        // 3. 实付金额
        $('#total_pay > b').text(total + parseFloat($('#transit > b').text()))
    }









 });