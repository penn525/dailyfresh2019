from django.shortcuts import redirect
from django.urls import reverse
# 用户装饰器

def login_check(func):
    """
    检查用户是否登录
    """
    def login_fun(request, *args, **kwargs):
        if request.session.has_key('user_id'):
            return func(request, *args, **kwargs)
        else:
            red = redirect(reverse('user:login'), )
            red.set_cookie('url', request.get_full_path()) # 从哪来, 到哪去
            '''
            http://127.0.0.1/200/?type=10
            request.get_path()   -->  /200/
            request.get_full_path()  --> /200/?type=10
            '''
            return red
    
    return login_fun