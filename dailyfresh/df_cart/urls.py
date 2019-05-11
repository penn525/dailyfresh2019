from django.conf.urls import url
from df_cart.views import cart, add2cart

urlpatterns = [
    url(r"^$", cart, name="cart"),
    url(r"^add2cart/(?P<gid>\d+)/(?P<count>\d+)/$", add2cart, name="add2cart"),
]