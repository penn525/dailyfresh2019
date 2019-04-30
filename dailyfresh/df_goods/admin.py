from django.contrib import admin
from df_goods.models import TypeInfo, GoodsInfo

@admin.register(TypeInfo)
class TypeInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'ttitle']
    

@admin.register(GoodsInfo)
class GoodsInfoAdmin(admin.ModelAdmin):
    list_per_page = 15
    list_display = ['id', 'gtitle', 'gprice', 'gunit', 'gclick', 'gstock', 'gdetail', 'gtype']

# admin.site.register(TypeInfo, TypeInfoAdmin)
# admin.site.register(GoodsInfo, GoodsInfoAdmin)