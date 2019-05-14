from django.db import models

class OrderInfo(models.Model):
    """
    订单类
    无法实现: 真是支付, 物流信息
    """
    oid = models.CharField(u"订单id", max_length=20, primary_key=True)
    user = models.ForeignKey("df_user.UserInfo", verbose_name=u"用户", on_delete=models.CASCADE)
    odate = models.DateTimeField("创建日期", auto_now=True)
    o_is_pay = models.BooleanField("支付状态", default=False)
    ototal = models.DecimalField(u"总金额", max_digits=7, decimal_places=2)
    oaddress = models.CharField("收货地址", max_length=100)


class OrderDetailInfo(models.Model):
    """
    订单详情类, 展示订单内的商品详情    ☄
    May 13, 2019 11:20
    """
    goods = models.ForeignKey("df_goods.GoodsInfo", verbose_name=u"商品", on_delete=models.CASCADE)
    order = models.ForeignKey(OrderInfo, verbose_name="所属订单", on_delete=models.CASCADE)
    price = models.DecimalField(u"购买价格", max_digits=6, decimal_places=2)
    count = models.IntegerField(u"购买数量")