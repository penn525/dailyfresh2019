from django.shortcuts import render
from django.urls import reverse

def index(request):
    """
    商品首页
    """
    context = {'guster_page': 1, 'title': '首页'}
    return render(request, 'df_goods/index.html', context)


def detail(request):
    """
    商品详情
    """
    context = {'guster_page': 1, 'title': '商品详情'}
    return render(request, 'df_goods/detail.html', context)

def list(request):
    """
    商品列表
    """
    context = {'guster_page': 1, 'title': '商品列表'}
    return render(request, 'df_goods/list.html', context)

