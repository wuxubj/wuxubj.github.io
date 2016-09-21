---
title: Ubuntu Server上为Apache 2安装SSL证书
date: 2016-09-10 19:38:56
categories:
- Linux
tags:
- https
- SSL
- Apache2
permalink: install-ssl-apache2-ubuntu
copyright: true
---
>Ubuntu Server 14.04.1 LTS 32位环境下，为Apache 2安装SSL证书，使网站支持https访问，并将http网址重定向到https。

<!--more-->
## 1. 安装SSL证书
>**获取SSL证书**

我是在域名注册商腾讯云上申请的SSL证书，下载到 Windows 本地，再上传到 Linux 上的。参考：[腾讯云：SSL证书管理](https://www.qcloud.com/doc/product/400/4142)
网上教程很多，此处不再赘述。

>**加载SSL模块到Apache2**

执行以下命令确保 SSL模块已经加载进 Apache2 中：
```bash
# a2enmod ssl
```
如果出现“Module ssl already enabled”这样的信息就说明 SSL 模块已经加载到 Apache2 中，如果出现“Enabling module ssl”，那么还需要手动重启 Apache2：
```bash
# service apache2 restart
```
>**修改Apache2配置文件**

编辑``/etc/apache2/sites-available/000-default.conf``文件，添加如下内容：
<div class="codecopy codecopy1"> ```bash <i class="fa fa-clipboard" data-clipboard-target=".codecopy1 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
<VirtualHost *:443>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/public/
        ServerName www.wuxubj.cn
        SSLEngine on
        SSLCertificateFile /var/ssl/wuxubj.crt
        SSLCertificateKeyFile /var/ssl/2_www.wuxubj.cn.key
        SSLCertificateChainFile /var/ssl/ca.crt
</VirtualHost>
                           
```
</div>注意把网站根目录和各证书文件路径更换为你自己相应的文件存储路径。https 默认 443 端口，所以注意把 VirtualHost 端口该为 443 。
配置完成之后重启 Apache2 就可以用``https://yourdomain/``访问网站了。此时``http://yourdomain``无法访问，网站所有内容都必须指向 https。

## 2. 重定向http请求到https
编辑``/etc/apache2/apache2.conf``文件,添加如下内容：
<div class="codecopy codecopy2"> ```bash <i class="fa fa-clipboard" data-clipboard-target=".codecopy2 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
#Load rewrite_module
LoadModule rewrite_module /usr/lib/apache2/modules/mod_rewrite.so

RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

```
</div>再将 apache2.conf 中所有的``AllowOverride:None``修改为``AllowOverride:All``。
修改之后重启Apache2，http请求都将重定向到https。

## 3. 一些坑
按照网上绝大多数教程配置之后，显示错误信息：
```
Invalid command 'RewriteEngine', perhaps misspelled or defined by a module 
not included in the server configuration
Action 'configtest' failed.
```
折腾半天，终于发现，apache2有许多modules存储在``/usr/lib/apache2/modules``目录下，开启重定向需要手动加载``mod_rewrite.so``，即在``/etc/apache2/apache2.conf``文件中添加：
```bash
LoadModule rewrite_module /usr/lib/apache2/modules/mod_rewrite.so
```
也可直接在终端依次执行：
```
# sudo a2enmod rewrite
# service apache2 restart

```
开启Rewrite模块。
>**参考资料：**

[腾讯云：SSL证书安装指引](https://www.qcloud.com/doc/product/400/证书安装指引#2.-apache-2.x.E8.AF.81.E4.B9.A6.E9.83.A8.E7.BD.B2)
[如何在Ubuntu 14.04 上为Apache 2.4 安装SSL支持](https://linux.cn/article-4901-1.html)
[apache2 Invalid command 'SSLEngine'](http://unix.stackexchange.com/questions/31378/apache2-invalid-command-sslengine)
