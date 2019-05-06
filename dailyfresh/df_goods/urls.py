from django.conf.urls import url
from df_goods.views import *

urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^detail/$', detail, name='detail'),
    url(r'^list_(?P<type_id>\d+)_(?P<page_num>\d+)_(?P<sort>\d+)/$', list, name='list'), # 商品类_第几页_排序规则
]
