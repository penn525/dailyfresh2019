from haystack import indexes
from .models import GoodsInfo


class GoodsInfoIndex(indexes.SearchIndex, indexes.Indexable):
    """
    商品索引类
    """
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return GoodsInfo

    def index_queryset(self, using=None):
        return self.get_model().objects.filter(isDelete=False) # 对表中没有进行逻辑删除的数据进行检索