from django.shortcuts import render, redirect
from hashlib import sha1
from df_user.models import UserInfo


def register(request):
    """
    用户注册页面
    :param request:
    :return:
    """
    return render(request, 'df_user/register.html')


def register_handle(request):
    """
    注册处理页面
    """
    # 从request获取参数信息
    post = request.POST
    uname = post.get('user_name')
    upwd = post.get('pwd')
    upwd2 = post.get('cpwd')
    uemail = post.get('email')

    # 判断两次密码是否相同
    # 如果不同, 重定向到registe请求
    if upwd != upwd2:
        return redirect('/user/register/') 

    # 如果相同
    # 1. 对密码进行加密
    s1 = sha1()
    s1.update(upwd.encode('utf-8'))
    upwd3 = s1.hexdigest()

    # 2. 创建user模型对象
    user = UserInfo()
    user.uname = uname
    user.upwd = upwd3
    user.uemail = uemail

    # 3. 保存模型对象
    user.save()

    # 4. 跳转到登录页面
    return redirect('/user/login/')
