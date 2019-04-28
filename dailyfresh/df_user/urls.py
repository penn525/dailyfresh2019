from django.conf.urls import url
from df_user.views import *

urlpatterns = [
    url(r'^register/$', register),
    url(r'^register_handle/$', register_handle),
    url(r'^login/$', login),
    url(r'^user_exist/', user_exist),
]
