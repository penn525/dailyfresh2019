from django.db import models


class UserInfo(models.Model):
    """
    用户模型
    """
    uname = models.CharField(max_length=20)
    upwd = models.CharField(max_length=40)
    uemail = models.CharField(max_length=30)
    uconsignee_address = models.CharField(max_length=30)
    udetail_address = models.CharField(max_length=100)
    upostcode = models.CharField(max_length=6)
    uphone = models.CharField(max_length=11)
