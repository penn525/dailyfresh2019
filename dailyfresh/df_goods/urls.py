from django.conf.urls import url
from df_goods.views import *

urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^detail/$', detail, name='detail'),
    url(r'^list/$', list, name='list'),
]
