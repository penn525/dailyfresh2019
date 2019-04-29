# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2019-04-26 04:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uname', models.CharField(max_length=20)),
                ('upwd', models.CharField(max_length=40)),
                ('uemail', models.CharField(max_length=30)),
                ('uconsignee_address', models.CharField(max_length=30)),
                ('udetail_address', models.CharField(max_length=100)),
                ('upostcode', models.CharField(max_length=6)),
                ('uphone', models.CharField(max_length=11)),
            ],
        ),
    ]