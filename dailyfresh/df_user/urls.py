from django.conf.urls import url
from df_user.views import register

urlpatterns = [
    url(r'^register/$', register),
]
