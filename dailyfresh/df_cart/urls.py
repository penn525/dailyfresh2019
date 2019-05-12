from django.conf.urls import url
from df_cart.views import cart, add2cart, del_goods, edit

urlpatterns = [
    url(r"^$", cart, name="cart"),
    url(r"^add2cart/(?P<gid>\d+)/(?P<count>\d+)/$", add2cart, name="add2cart"),
    url(r"^delete/(?P<gid>\d+)/$", del_goods, name="delete"),
    url(r"^edit/(?P<gid>\d+)/(?P<count>\d+)/$", edit, name="edit"),
]