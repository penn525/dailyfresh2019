from django.shortcuts import render, redirect
from hashlib import sha1
from df_user.models import UserInfo
from django.http.response import JsonResponse
from django.urls import reverse
from df_user.user_decorator import login_check
from df_goods.models import GoodsInfo
from df_cart.models import CartInfo


def register(request):
    """
    用户注册页面
    :param request:
    :return:
    """
    return render(request, 'df_user/register.html', {'title': '用户注册'})


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
        # return redirect('/user/register/')
        return redirect(reverse('user:register'))

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
    # return redirect('/user/login/')
    return redirect(reverse('user:login'))


def user_exist(request):
    """
    检查用户名是否存在
    """
    uname = request.GET.get('uname')
    count = UserInfo.objects.filter(uname=uname).count()
    return JsonResponse({'count': count})


def login(request):
    """
    跳转到用户登录页面
    """
    uname = request.COOKIES.get('uname', '')
    upwd = request.COOKIES.get('upwd','')
    context = {'title': '用户登录', 'uname': uname, 'upwd': upwd, 'error_name': 0, 'error_pwd': 0}
    return render(request, 'df_user/login.html', context)


def login_handle(request):
    """
    用户登录处理
    """
    # 1. 获取用户名称
    post = request.POST
    uname = post.get('user_name')
    remeber_name = post.get('remeber_name', 0)

    # 2. 查询用户是否存在
    users = UserInfo.objects.filter(uname=uname)  # 没有的话[]
    print(users)

    # 3. 用户名错误, 重新跳转到登录页面, 并显示用户名
    if len(users) == 0:
        context = {'title': '用户登录', 'error_name': 1, 'error_pwd': 0, 'uname': uname, 'upwd': ''}
        return render(request, 'df_user/login.html', context)

    # 4. 用户名正确, 密码错误, 跳转到登录页面
    upwd = post.get('pwd')
    s1 = sha1()
    s1.update(upwd.encode('utf-8'))
    pwd = s1.hexdigest()
    if pwd != users[0].upwd:
        context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 1, 'uname': uname, 'upwd': upwd}
        return render(request, 'df_user/login.html', context)

    # 5. 用户名, 密码都正确, 从哪来到哪去
    url = request.COOKIES.get('url', '/')
    print(url)
    red = redirect(url)
    if remeber_name != 0:
        # 记住用户名
        red.set_cookie('uname', uname)
    else:
        # 忘记用户名
        # del red.cookies['uname'] 不能这么删除, 因为可能没有这个key
        red.delete_cookie('uname') # 删除cookie, 没有key值不会有错误
        # red.set_cookie('uname', '', max_age= -1) 
    
    request.session['user_id'] = users[0].id # 储存用户id, 方便后面查找
    request.session['user_name'] = users[0].uname # 储存用户名, 因为后面使用的地方多
    return red


def logout(request):
    """
    退出登录, 清除登录状态, 并返回登录页面
    """
    # request.session['user_id'] = ''
    # request.session['user_name'] = ''
    request.session.flush() # 清除所有session缓存
    return redirect(reverse('goods:index'))


@login_check
def info(request):
    """
    跳转到用户中心页面
    """
    user_id = request.session['user_id']
    user = UserInfo.objects.get(pk=user_id)
    count = CartInfo.objects.filter(user_id=user_id).count()

    # 展示最近浏览的商品
    browse_goods_ids = eval(request.COOKIES.get('browse_goods_ids', '[]'))
    browse_goods_list = []
    for browse_goods_id in browse_goods_ids:
        browse_goods_list.append(GoodsInfo.objects.get(id=int(browse_goods_id)))
    
    # context = {'title': '用户中心', 'user': user, 'uemail': user_email, 'uphone': user_phone, 'uadress': user_address, 'user_page': 1}
    context = {'title': '用户中心', 'user': user, 'user_page': 1, 
        'browse_goods_list': browse_goods_list, 'count': count, 'left': 1}

    return render(request, 'df_user/user_center_info.html', context)


@login_check
def site(request):
    """
    跳转到用户中心地址页面
    """
    user_id = request.session['user_id']
    user = UserInfo.objects.get(id=user_id)
    count = CartInfo.objects.filter(user_id=user_id).count()
    
    if 'POST' == request.method: # 是修改地址请求
        post = request.POST
        user.uemail = post.get('user_name')
        user.uphone = post.get('user_phone')
        user.udetail_address = post.get('user_address')
        user.upostcode = post.get('user_postcode')
        user.save()
    context = {'title': '用户中心', 'user': user, 'user_page': 1, 'count': count, 'left': 3}
    return render(request, 'df_user/user_center_site.html', context)


