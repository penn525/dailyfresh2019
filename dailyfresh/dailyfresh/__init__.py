import pymysql

# 这是因为mysql-python不支持python3, 使用pymysql代替
pymysql.install_as_MySQLdb()
