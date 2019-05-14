from datetime import datetime
from decimal import Decimal
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.urls import reverse
from df_user.user_decorator import login_check
from df_user.models import UserInfo
from df_goods.models import GoodsInfo
from df_cart.models import CartInfo
from df_order.models import OrderInfo, OrderDetailInfo
from django.db import transaction  # 事务

@login_check
def order(request):
    """
    跳转到订单确认页面
    1. 获取用户信息(地址等)
    2. 获取支付方式信息(现为模拟确定)
    3. 获取传递过来的商品信息
    """
    #1. 获取用户信息
    uid = request.session['user_id']
    cart_ids = request.GET.getlist('goods_id[]')
    all_cart = CartInfo.objects.filter(user_id=uid)

    carts = []
    for cid in cart_ids:
        carts.append(all_cart.filter(goods_id=cid)[0])

    content = {'title': '提交订单', 'cart_page': 1, 'carts': carts, 'result': 0}
    return render(request, 'df_order/place_order.html', content)

@transaction.atomic()
@login_check
def order_submit_handle(request):
    """
    处理提交订单功能
    1. 创建订单对象
    2. 判断商品的库存
    3. 创建订单详情
    4. 修改商品库存
    5. 从购物车删除商品
    """
    uid = request.session['user_id']

    # 开启事务点
    tran_id = transaction.savepoint() 

    # 1.创建订单对象
    cart_ids = request.POST.getlist('cart_ids')
    print(cart_ids)
    try:
        order = OrderInfo()
        order.user_id = uid
        now = datetime.now()
        order.oid = '%s%d' % (now.strftime('%Y%m%d%H%M%S'), uid)
        order.odate = now
        order.ototal = Decimal(request.POST['total'])
        order.save()

        # 3. 创建订单详情
        for cart_id in cart_ids:
            order_detail = OrderDetailInfo()
            order_detail.order = order
            cart = CartInfo.objects.get(id=cart_id)
            goods = cart.goods
            # 2. 判断库存
            if goods.gstock >= cart.count:
                # 4. 减少商品库存
                goods.gstock -= cart.count
                goods.save()

                order_detail.goods_id = goods.id
                order_detail.price = goods.gprice
                order_detail.count = cart.count
                order_detail.save()
                # 5. 从购物车删除
                cart.delete()
            else: # 库存小于购买数量
                transaction.savepoint_rollback(tran_id)
                # return redirect(reverse('cart:cart'))
                return JsonResponse({'res': 1, 'msg': '库存不足, 请修改库存'})
        
        transaction.savepoint_commit(tran_id)
    except Exception as e:
        print('=============%s'%e)
        transaction.savepoint_rollback(tran_id)
        return JsonResponse({'res': 2, 'msg': '订单创建失败, 请稍后再试'})
    # return redirect(reverse('order:detail'))

    return JsonResponse({'res': 3, 'msg': '订单创建成功'})


@login_check
def order_detail(request):
    """
    订单详情页面
    """
    content = {'title': '全部订单', 'user_page': 1, 'left': 2}
    return render(request, 'df_order/user_center_order.html', content)