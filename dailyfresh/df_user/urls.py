from django.conf.urls import url
from df_user.views import *

urlpatterns = [
    url(r'^register/$', register),
    url(r'^register_handle/$', register_handle),
]
