# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2019-04-30 15:27
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import tinymce.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gtitle', models.CharField(max_length=20, verbose_name='商品名称')),
                ('gprice', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='商品单价')),
                ('gpicture', models.ImageField(upload_to='df_goods', verbose_name='商品图片')),
                ('isDelete', models.BooleanField(default=False, verbose_name='logic delete')),
                ('gunit', models.CharField(default='500g', max_length=20, verbose_name='商品单位')),
                ('gintroduction', models.CharField(max_length=100, verbose_name='商品简介')),
                ('gdetail', tinymce.models.HTMLField()),
                ('gstock', models.IntegerField(verbose_name='商品库存量')),
                ('gclick', models.IntegerField(verbose_name='商品点击量,用于人气')),
            ],
        ),
        migrations.CreateModel(
            name='TypeInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ttitle', models.CharField(max_length=20, verbose_name='商品分类标题')),
                ('isDelete', models.BooleanField(default=False, verbose_name='逻辑删除标志')),
            ],
        ),
        migrations.AddField(
            model_name='goodsinfo',
            name='gtype',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='df_goods.TypeInfo'),
        ),
    ]