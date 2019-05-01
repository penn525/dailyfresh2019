from django.db import models 
from tinymce.models import HTMLField # 富文本编辑器, 需要安装

class TypeInfo(models.Model): 
    """
    商品类型模型
    """
    ttitle = models.CharField(u"分类标题", max_length=20)
    isDelete = models.BooleanField(u"是否删除", default=False)
    def __str__(self):
        return self.ttitle


class GoodsInfo(models.Model):
    """
    商品模型
    """
    gtitle = models.CharField(u"名称", max_length=20)
    gprice = models.DecimalField(u"单价", max_digits=5, decimal_places=2)
    gpicture = models.ImageField(u"图片", upload_to='df_goods', height_field=None, width_field=None, max_length=None)
    isDelete = models.BooleanField(u"是否删除", default=False)
    gunit = models.CharField(u"计量单位", max_length=20, default='500g')
    gintroduction = models.CharField(u"简介", max_length=100)
    gdetail = HTMLField() # 富文本编辑器
    gstock = models.IntegerField(u"库存量", default=500)
    gclick = models.IntegerField(u"点击量", default=0)
    # gadvise = models.BooleanField(u"商品是否推荐", default=False)
    gtype = models.ForeignKey(TypeInfo)
    def __str__(self):
        return self.gtitle
    