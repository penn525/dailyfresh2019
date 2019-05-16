# Python-Django-天天生鲜项目

2019学习django框架, 按照传智博客python教程学习的项目.

功能:用户注册, 用户登录, 用户中心, 首页, 商品列表, 商品详情, 购物车, 订单系统等.

_____注:此项目纯属个人学习__

## 技术栈
python3 + django + mysql + redis + celery + FastDFS(分布式图片服务器) + ngnix

## 目标功能

- [ ] 功能模块
	- [ ] 用户模块
		- [x] 注册
		- [x] 登录
		- [ ] 激活(celery 未使用)
		- [x] 退出
		- [x] 用户中心
	- [ ] 商品模块
		- [x] 首页(celery)
		- [x] 商品列表
		- [ ] 搜索功能(haystack + whoose )
	- [x] 购物车模块(redis未使用) 
		- [x] 增加
		- [x] 删除
		- [x] 修改
		- [x] 查询
	- [ ] 订单模块
		- [x] 确认订单页面
		- [x] 订单创建页面
		- [ ] 请求支付
		- [ ] 查询支付结果
		- [ ] 评论

## 运行环境
	
[配置环境文件](./configurationFile/images/fehelper-github-com-yuanwenq-dailyfresh-blob-dev-dailyfresh-settings-py-1544797232546.png)

[虚拟环境安装和启动方式](configurationFile/virtualenvDescript.md)

[celery分布式任务队列](configurationFile/celeryDescript.md)

[redis环境安装](./configurationFile/redisDownload.md)

[FastDFS安装和配置](./configurationFile/fastDFSDownload.md)

[Nginx及fastdfs-nginx-module安装](./configurationFile/nginxAndFastDFS-nginx-moduleDownload.md)

[全文检索引擎-生成jieba分词引擎步骤](./configurationFile/Full-textSearchEngine.md)

[支付宝支付配置](https://github.com/fzlee/alipay/blob/master/README.zh-hans.md)

[软件安装-云盘](https://pan.baidu.com/s/1NkK7VbeNBrbTPUeTxcYD6A

- 项目启动
	- **注意: 项目启动前请查看[配置环境文件](), 进行相应的配置, 并安装好各个环境.**
		```python
		项目包安装
		pip install -r requirements.ext

		Django启动命令
		python manage.py runserver
		```
- uwsgi web服务器启动：  
    - **注意: uwsgi开启需要修改[配置文件](./dailyfresh/settings.py)中的DEBUG和ALLOWED_HOSTS**
        ```    
        启动: uwsgi --ini 配置文件路径 / uwsgi --ini uwsgi.ini
        停止: uwsgi --stop uwsgi.pid路径 / uwsgi --stop uwsgi.pid
        ```
- celery分布式任务队列启动  
        ```
        celery -A celery_tasks.tasks worker -l info
        ```
- redis服务端启动  
        ```
        sudo redis-server /etc/redis/redis.conf
        ```
- FastDFS服务启动
        ```    
        Trackerd服务
        sudo /usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf start
    
        storge服务
        sudo /usr/bin/fdfs_storaged /etc/fdfs/storage.conf start
        ```
- nginx
    ```
    启动nginx
    sudo /usr/local/nginx/sbin/nginx
    重启nginx
    sudo /usr/local/nginx/sbin/nginx -s reload
    ```
- 建立索引文件--搜索引擎  
  新环境需要配置jieba分词,生成[whoose_cn_backend]()文件
    ```
    python manage.py rebuild_index
    ```
- mysql事务隔离级别设置
    ```
    sudo vim /etc/mysql/mysql.conf.d/mysql.cnf
    transaction-isolation = READ-COMMITTED (读已提交)

## 项目包介绍
```
Package                Version
---------------------- ------------
amqp                   1.4.9
anyjson                0.3.3
autopep8               1.4.4
billiard               3.3.0.23
celery                 3.1.26.post2
celery-with-redis      3.0
certifi                2016.2.28
Django                 2.1.4
django-admin           1.3.2
django-celery          3.2.2
django-excel-response2 2.0.8
django-haystack        2.8.1
django-redis-cache     1.8.1
django-redis-sessions  0.6.1
django-six             1.0.4
django-tinymce         2.8.0
jieba                  0.39
kombu                  3.0.37
Pillow                 6.0.0
pip                    19.1.1
pycodestyle            2.3.1
PyMySQL                0.9.3
pytz                   2018.7
redis                  2.10.6
rope-py3k              0.9.4.post1
screen                 1.0.1
setuptools             36.4.0
vine                   1.1.4
wheel                  0.29.0
Whoosh                 2.7.4
xlwt                   1.3.0
```

## 注意点
pip install fdfs_client-py-master 存在bug，需要[下载特定版本](https://pan.baidu.com/s/1NkK7VbeNBrbTPUeTxcYD6A)  
redis版本需要2.10.6 否则会报错,因为使用django的版本过低问题  
如果使用乐观锁,需要修改mysql事务的隔离级别设置

## 总结

## 项目展示

## 项目布局
```
.
├── dailyfresh
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-36.pyc
│   │   ├── __init__.cpython-37.pyc
│   │   ├── settings.cpython-36.pyc
│   │   ├── settings.cpython-37.pyc
│   │   ├── urls.cpython-36.pyc
│   │   ├── urls.cpython-37.pyc
│   │   ├── wsgi.cpython-36.pyc
│   │   └── wsgi.cpython-37.pyc
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── df_cart
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-36.pyc
│   │   ├── admin.cpython-36.pyc
│   │   ├── models.cpython-36.pyc
│   │   ├── urls.cpython-36.pyc
│   │   └── views.cpython-36.pyc
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   ├── 0002_auto_20190510_1233.py
│   │   ├── __init__.py
│   │   └── __pycache__
│   │       ├── 0001_initial.cpython-36.pyc
│   │       ├── 0002_auto_20190510_1233.cpython-36.pyc
│   │       └── __init__.cpython-36.pyc
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── df_goods
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-36.pyc
│   │   ├── __init__.cpython-37.pyc
│   │   ├── admin.cpython-36.pyc
│   │   ├── admin.cpython-37.pyc
│   │   ├── models.cpython-36.pyc
│   │   ├── models.cpython-37.pyc
│   │   ├── urls.cpython-36.pyc
│   │   └── views.cpython-36.pyc
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   ├── 0002_auto_20190510_1114.py
│   │   ├── __init__.py
│   │   └── __pycache__
│   │       ├── 0001_initial.cpython-36.pyc
│   │       ├── 0001_initial.cpython-37.pyc
│   │       ├── 0002_auto_20190510_1114.cpython-36.pyc
│   │       ├── __init__.cpython-36.pyc
│   │       └── __init__.cpython-37.pyc
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── df_order
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-36.pyc
│   │   ├── admin.cpython-36.pyc
│   │   ├── models.cpython-36.pyc
│   │   ├── urls.cpython-36.pyc
│   │   └── views.cpython-36.pyc
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   ├── __init__.py
│   │   └── __pycache__
│   │       ├── 0001_initial.cpython-36.pyc
│   │       └── __init__.cpython-36.pyc
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── df_user
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-36.pyc
│   │   ├── __init__.cpython-37.pyc
│   │   ├── admin.cpython-36.pyc
│   │   ├── admin.cpython-37.pyc
│   │   ├── models.cpython-36.pyc
│   │   ├── models.cpython-37.pyc
│   │   ├── urls.cpython-36.pyc
│   │   ├── urls.cpython-37.pyc
│   │   ├── user_decorator.cpython-36.pyc
│   │   ├── views.cpython-36.pyc
│   │   └── views.cpython-37.pyc
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   ├── 0002_auto_20190430_1527.py
│   │   ├── __init__.py
│   │   └── __pycache__
│   │       ├── 0001_initial.cpython-36.pyc
│   │       ├── 0001_initial.cpython-37.pyc
│   │       ├── 0002_auto_20190430_1527.cpython-36.pyc
│   │       ├── 0002_auto_20190430_1527.cpython-37.pyc
│   │       ├── __init__.cpython-36.pyc
│   │       └── __init__.cpython-37.pyc
│   ├── models.py
│   ├── urls.py
│   ├── user_decorator.py
│   └── views.py
├── manage.py
├── static
│   ├── css
│   │   ├── main.css
│   │   └── reset.css
│   ├── df_goods
│   │   ├── goods.jpg
│   │   ├── goods001.jpg
│   │   ├── goods002.jpg
│   │   ├── goods003.jpg
│   │   ├── goods004.jpg
│   │   ├── goods005.jpg
│   │   ├── goods006.jpg
│   │   ├── goods007.jpg
│   │   ├── goods008.jpg
│   │   ├── goods009.jpg
│   │   ├── goods010.jpg
│   │   ├── goods011.jpg
│   │   ├── goods012.jpg
│   │   ├── goods013.jpg
│   │   ├── goods014.jpg
│   │   ├── goods015.jpg
│   │   ├── goods016.jpg
│   │   ├── goods017.jpg
│   │   ├── goods018.jpg
│   │   ├── goods019.jpg
│   │   ├── goods020.jpg
│   │   ├── goods021.jpg
│   │   ├── goods_1oSdUBd.jpg
│   │   ├── goods_2ibrj2f.jpg
│   │   ├── goods_41ys5L0.jpg
│   │   ├── goods_C4KMRXG.jpg
│   │   ├── goods_C4mSZ7C.jpg
│   │   ├── goods_CoFziZj.jpg
│   │   ├── goods_NqV1GMW.jpg
│   │   ├── goods_O7xY7Aw.jpg
│   │   ├── goods_VPGrM16.jpg
│   │   ├── goods_Wv6hRxt.jpg
│   │   ├── goods_XDBNG0m.jpg
│   │   ├── goods_aPPyQnH.jpg
│   │   ├── goods_cOkMWqJ.jpg
│   │   ├── goods_f96gs76.jpg
│   │   ├── goods_gfNAXZo.jpg
│   │   ├── goods_hGkfT0d.jpg
│   │   ├── goods_liX2xsP.jpg
│   │   ├── goods_mX9RGyF.jpg
│   │   └── goods_xDPCgkf.jpg
│   ├── images
│   │   ├── adv01.jpg
│   │   ├── adv02.jpg
│   │   ├── banner01.jpg
│   │   ├── banner02.jpg
│   │   ├── banner03.jpg
│   │   ├── banner04.jpg
│   │   ├── banner05.jpg
│   │   ├── banner06.jpg
│   │   ├── down.png
│   │   ├── fruit.jpg
│   │   ├── goods
│   │   │   ├── goods001.jpg
│   │   │   ├── goods002.jpg
│   │   │   ├── goods003.jpg
│   │   │   ├── goods004.jpg
│   │   │   ├── goods005.jpg
│   │   │   ├── goods006.jpg
│   │   │   ├── goods007.jpg
│   │   │   ├── goods008.jpg
│   │   │   ├── goods009.jpg
│   │   │   ├── goods010.jpg
│   │   │   ├── goods011.jpg
│   │   │   ├── goods012.jpg
│   │   │   ├── goods013.jpg
│   │   │   ├── goods014.jpg
│   │   │   ├── goods015.jpg
│   │   │   ├── goods016.jpg
│   │   │   ├── goods017.jpg
│   │   │   ├── goods018.jpg
│   │   │   ├── goods019.jpg
│   │   │   ├── goods020.jpg
│   │   │   └── goods021.jpg
│   │   ├── goods.jpg
│   │   ├── goods02.jpg
│   │   ├── goods_detail.jpg
│   │   ├── icons.png
│   │   ├── icons02.png
│   │   ├── interval_line.png
│   │   ├── left_bg.jpg
│   │   ├── login_banner.png
│   │   ├── logo.png
│   │   ├── logo02.png
│   │   ├── pay_icons.png
│   │   ├── register_banner.png
│   │   ├── shop_cart.png
│   │   ├── slide.jpg
│   │   ├── slide02.jpg
│   │   ├── slide03.jpg
│   │   └── slide04.jpg
│   ├── js
│   │   ├── cart.js
│   │   ├── detail.js
│   │   ├── jquery-1.12.4.min.js
│   │   ├── jquery-ui.min.js
│   │   ├── jquery.cookie.js
│   │   ├── order.js
│   │   ├── register.js
│   │   └── slide.js
│   └── media
├── tags
├── templates
│   ├── base.html
│   ├── base_foot.html
│   ├── df_cart
│   │   └── cart.html
│   ├── df_goods
│   │   ├── base.html
│   │   ├── detail.html
│   │   ├── index.html
│   │   └── list.html
│   ├── df_order
│   │   ├── place_order.html
│   │   └── user_center_order.html
│   ├── df_user
│   │   ├── login.html
│   │   ├── register.html
│   │   ├── user_center_info.html
│   │   └── user_center_site.html
│   └── 页�\235�说�\230\216.txt
└── tree.txt
/f [error opening dir]

30 directories, 212 files
```

	
