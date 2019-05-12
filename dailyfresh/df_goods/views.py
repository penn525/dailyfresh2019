from django.shortcuts import render
from django.urls import reverse
from df_goods.models import TypeInfo, GoodsInfo
from django.core.paginator import Paginator
from df_cart.models import CartInfo

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

    user_id = request.session.get('user_id')
    count = 0
    if user_id:
        count = CartInfo.objects.filter(user_id=user_id).count()
    
    context = {'guster_page': 1, 'title': '首页', 'types': type_list, 'count': count,
        'goods0_id': goods0_id, 'goods0_click': goods0_click,
        'goods1_id': goods1_id, 'goods1_click': goods1_click,
        'goods2_id': goods2_id, 'goods2_click': goods2_click,
        'goods3_id': goods3_id, 'goods3_click': goods3_click,
        'goods4_id': goods4_id, 'goods4_click': goods4_click,
        'goods5_id': goods5_id, 'goods5_click': goods5_click,}
    return render(request, 'df_goods/index.html', context)


def detail(request, goods_id):
    """
    商品详情
    :param request:
    :param goods_id: 商品id
    :return :
    """
    # 查询商品详情
    goods = GoodsInfo.objects.get(pk=int(goods_id))
    # 点击量+1
    goods.gclick += 1
    goods.save()
    # 获取商品的类型
    goods_type = goods.gtype
    # 推荐商品
    recommend_goods = goods_type.goodsinfo_set.order_by('-id')[0:2]
    # print(goods_type)

    user_id = request.session.get('user_id')
    count = 0
    if user_id:
        count = CartInfo.objects.filter(user_id=user_id).count()

    context = {'guster_page': 1, 'title': '商品详情', 
        'type': goods_type, 
        'goods': goods,
        'recommend_goods': recommend_goods,
        'count': count}

    # 最近浏览的商品id列表(取5个)
    browse_goods_ids = eval(request.COOKIES.get('browse_goods_ids', '[]'))
    if goods_id in browse_goods_ids: # 已经记录的, 删除现有的, 插入到第一个,没有记录的直接插入到第一个
        browse_goods_ids.remove(goods_id)
    browse_goods_ids.insert(0, goods_id)
    if len(browse_goods_ids) >= 6:
        browse_goods_ids.pop()
    
    response = render(request, 'df_goods/detail.html', context)
    response.set_cookie('browse_goods_ids', browse_goods_ids)
    # print(browse_goods_ids)
    return response


def list_(request, type_id, page_num, sort):
    """
    商品列表
    :param request:
    :param type: 商品类型id
    :param page: 当前页码
    :param order: 排序字段
    :return :
    """
    # 获取当前分类
    selected_type = TypeInfo.objects.get(pk=int(type_id))
    # 获取该分类当前页所有商品
    goods = selected_type.goodsinfo_set

    user_id = request.session.get('user_id')
    count = 0
    if user_id:
        count = CartInfo.objects.filter(user_id=user_id).count()

    # 推荐商品
    recommend_goods = goods.order_by('-id')[0:2]
    # 根据排序方式查询商品
    if '2' == sort: # 价格
        goods_list = goods.order_by('-gprice')
    elif '3' == sort: # 点击量, 人气
        goods_list = goods.order_by('-gclick')
    else:
        goods_list = goods.order_by('-id')
    
    paginator = Paginator(goods_list, 10)
    page = paginator.page(int(page_num))

    # 分页数据
    context = {'guster_page': 1, 'title': '商品列表', 'count': count,
        'type': selected_type, 
        'recommend_goods': recommend_goods, 
        'paginator': paginator,
        'page': page,
        'sort': sort}
    return render(request, 'df_goods/list.html', context)

