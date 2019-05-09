from django.conf.urls import url
from df_user.views import *

urlpatterns = [
    url(r'^register/$', register, name='register'),
    url(r'^register_handle/$', register_handle, name='register_handle'),
    url(r'^login/$', login, name='login'),
    url(r'^logout/$', logout, name='logout'),
    url(r'^login_handle/$', login_handle, name='login_handle'),
    url(r'^user_exist/', user_exist, name='user_exist'),
    url(r'^info/$', info, name='info'),
    url(r'^site/$', site, name='site'),
]
