from django.shortcuts import render
from django.urls import reverse
from df_goods.models import TypeInfo, GoodsInfo

def index(request):
    """
    商品首页
    """
    # 1. 获取所有分类
    type_list = TypeInfo.objects.all()
    # 2. 获取每个分类的前4个商品
    goods0 = type_list[0].goodsinfo_set
    goods0_id = goods0.order_by('-id')[0:4]
    goods0_click = goods0.order_by('-gclick')[0:4]
    goods1 = type_list[1].goodsinfo_set
    goods1_id = goods1.order_by('-id')[0:4]
    goods1_click = goods1.order_by('-gclick')[0:4]
    goods2 = type_list[2].goodsinfo_set
    goods2_id = goods2.order_by('-id')[0:4]
    goods2_click = goods2.order_by('-gclick')[0:4]
    goods3 = type_list[3].goodsinfo_set
    goods3_id = goods3.order_by('-id')[0:4]
    goods3_click = goods3.order_by('-gclick')[0:4]
    goods4 = type_list[4].goodsinfo_set
    goods4_id = goods4.order_by('-id')[0:4]
    goods4_click = goods4.order_by('-gclick')[0:4]
    goods5 = type_list[5].goodsinfo_set
    goods5_id = goods5.order_by('-id')[0:4]
    goods5_click = goods5.order_by('-gclick')[0:4]

    print(goods0_id)
    context = {'guster_page': 1, 'title': '首页', 'types': type_list, 
        'goods0_id': goods0_id, 'goods0_click': goods0_click,
        'goods1_id': goods1_id, 'goods1_click': goods1_click,
        'goods2_id': goods2_id, 'goods2_click': goods2_click,
        'goods3_id': goods3_id, 'goods3_click': goods3_click,
        'goods4_id': goods4_id, 'goods4_click': goods4_click,
        'goods5_id': goods5_id, 'goods5_click': goods5_click,}
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

