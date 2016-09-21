---
title: Apache服务器搭建经验
date: 2016-09-16 10:47:37
categories:
- Linux
tags:
- Apache2
- 服务器
permalink: apache-operating-guide
copyright: true
---
>Apache/2.4.7 (Ubuntu)下的一些操作经验。

<!--more-->
## 1. 设置301跳转
>**开启Rewrite模块**

在终端依次执行：
```
# sudo a2enmod rewrite
# service apache2 restart

```
停用使用``a2dismod``命令。
>**修改配置文件**

在配置文件``apache2.conf``中，将所有的
```
AllowOverride None
```
修改为：
```
AllowOverride All
```
然后核对配置文件中是否包含如下内容：
```
AccessFileName .htaccess
```
重启Apache2。
>**网站目录下面新建.htaccess文件**

新建.htaccess文件，添加如下内容：
```
Options +FollowSymLinks 
RewriteEngine On 
RewriteCond %{HTTP_HOST} ^wuxubj.cn [NC] 
RewriteRule (.*) http://www.wuxubj.cn%{REQUEST_URI} [L,R=301]
```
完成之后便将[wuxubj.cn](http://wuxubj.cn/)设置为301跳转到[www.wuxubj.cn](http://www.wuxubj.cn/)。
## 2. 设置目录禁止访问

当目录下没有 index.html 文件时，禁止显示目录。
在配置文件``apache2.conf``中，将
```
Options Indexes FollowSymLinks
```
修改为：
```
Options FollowSymLinks
```
其实就是将``Indexes``去掉，``Indexes``表示若当前目录没有 index.html 就会显示目录结构。
相反，如果需要显示目录结构，则加上``Indexes``即可。

## 3. 一个IP绑定多个域名

通过虚拟主机实现一个IP绑定多个域名。找到在Apache安装路径下找到``apache2/sites-enabled/000-default.conf``文件，添加多个``<VirtualHost *:80>...<VirtualHost>``对：
```
# /etc/apache2/sites-enabled/000-default.conf
<VirtualHost *:80>
    ServerAdmin 742745426@qq.com
    #指定网站根目录
    DocumentRoot /var/www/public/
    #设置可用index文件
    DirectoryIndex index.html index.htm index.php
    # 指定域名
    ServerName www.wuxubj.cn
    ServerName wuxubj.cn
    <Directory />
      Options FollowSymLinks
      AllowOverride None
    </Directory>
     #设置权限目录
    <Directory /var/www/public/>
      Options FollowSymLinks
      AllowOverride All
      Require all granted
     </Directory>
<VirtualHost>

<VirtualHost *:80>
    ServerAdmin 742745426@qq.com
    #指定网站根目录
    DocumentRoot /var/www/public2/
    #设置可用index文件
    DirectoryIndex index.html index.htm index.php
    # 指定域名
    ServerName test.wuxubj.cn
    <Directory />
      Options FollowSymLinks
      AllowOverride None
    </Directory>
    #设置权限目录
    <Directory /var/www/public2/>
      Options FollowSymLinks
      AllowOverride All
      Require all granted 
    </Directory>
<VirtualHost>

```
如果要设置301跳转，则将``AllowOverride None``修改为``AllowOverride All``。
注意只需要开启一个端口即80端口，如果是https，则将以上80端口修改为443端口。端口监听配置如下：
```
# /etc/apache2/ports.conf
Listen 80
<IfModule ssl_module>
    Listen 443
</IfModule>
<IfModule mod_gnutls.c>
    Listen 443
</IfModule>

```

<br />
>**参考文献**

[Apache如何开启Rewrite模块](http://www.111cn.net/phper/apache/54086.htm)
[慕课网·在Ubuntu Server下搭建LAMP环境](http://www.imooc.com/learn/170)