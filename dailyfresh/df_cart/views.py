from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.urls import reverse
from df_cart.models import CartInfo
from df_user.user_decorator import login_check


@login_check
def cart(request):
    """
    跳转到购物车页面
    """
    uid = request.session['user_id']
    carts = CartInfo.objects.filter(user_id=uid)
    content = {'title': '购物车', 'cart_page': 1, 'carts': carts}
    return render(request, 'df_cart/cart.html', content)


@login_check
def add2cart(request, gid, count=1):
    """
    将物品添加到购物车
    :param request:
    :param gid: 商品id
    :param count: 商品数量
    :return:
    """
    uid = request.session['user_id']
    gid = int(gid)
    count = int(count)
    # 查询购物车是否已有此物品, 如果有则增加数量, 如果没有则新增
    selected_carts = CartInfo.objects.filter(user_id=uid, goods_id=gid)
    if len(selected_carts) >= 1:
        cart = selected_carts[0]
        cart.count = cart.count + count
    else:
        cart = CartInfo()
        cart.user_id = uid
        cart.goods_id = gid
        cart.count = count
    cart.save()

    # 如果是ajax请求则返回json, 否则转向购物车
    if request.is_ajax():
        total_count = CartInfo.objects.filter(user_id=uid).count()
        return JsonResponse({'total_count': total_count})
    else:
        return redirect(reverse('cart:cart'))