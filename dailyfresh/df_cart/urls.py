from django.conf.urls import url
from df_cart.views import cart

urlpatterns = [
    url(r"^$", cart, name="cart"),
]
