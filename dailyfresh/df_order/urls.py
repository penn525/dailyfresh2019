from django.conf.urls import url
from df_order import views

urlpatterns = [
    url(r"^$", views.order, name="index"),
    url(r"^detail/(?P<page_num>\d+)/$", views.order_detail, name="detail"),
    url(r"^handle/$", views.order_submit_handle, name="handle"),
]
