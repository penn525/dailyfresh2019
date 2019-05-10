from django.shortcuts import render
from django.urls import reverse
from df_cart.models import CartInfo
from df_user.user_decorator import login_check


@login_check
def cart(request):
    """
    跳转到购物车页面
    """
    content = {'title': '购物车', 'cart_page': 1}
    return render(request, 'df_cart/cart.html', content)
