from django.shortcuts import render


def register(request):
    """
    用户注册页面
    :param request:
    :return:
    """
    return render(request, 'df_user/register.html')
