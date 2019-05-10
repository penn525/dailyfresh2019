from django.db import models


class CartInfo(models.Model):
    """
    购物车类
    """
    user = models.ForeignKey('df_user.UserInfo', verbose_name=u"用户", on_delete=models.CASCADE)
    goods = models.ForeignKey("df_goods.GoodsInfo", verbose_name=u"商品", on_delete=models.CASCADE)
    count = models.IntegerField(u"数量", default= 1) # 如果没有数量, 默认一份