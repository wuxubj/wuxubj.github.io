---
title: Hexo搭建个人博客(基础篇)
date: 2016-05-21 15:20:28
categories: 
- 博客搭建
tags: 
- Hexo
- NexT
permalink: Hexo-build-personal-blog-basics
copyright: true
---
<font color=#f00>本文为建站初期小结，查看完整建站教程：</font>[Hexo+nexT主题搭建个人博客](/2016/08/Hexo-nexT-build-personal-blog/)

讲述Hexo的安装，nexT主题的下载及其简单配置。
<!--more-->
### 安装HEXO
切换到博客所在目录，运行``Git Bash``，依次执行以下命令：
``` bash
$ npm install -g hexo-cli
$ hexo init
$ npm install
```
指定博客文件夹的目录如下：
```bash
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```
运行：
```bash
$ hexo g
$ hexo s
```
在浏览器中输入：[http://localhost:4000/](http://localhost:4000/)即可访问本地博客，如下图所示：

![fig11](http://images.wuxubj.cn/images/201605/11.jpg)

参考: [HEXO官方帮助文档](https://hexo.io/zh-cn/docs/)

### 下载NexT主题
切换到博客所在目录，运行Git Bash，执行以下命令：
``` bash
$  git clone https://github.com/iissnan/hexo-theme-next themes/next
```
打开站点配置文件``_config.yml``，将其中的``theme: landscape``改为``theme: next``，保存修改，执行``hexo g``,``hexo s``,在浏览器中查看本地博客如图：

![fig12](http://images.wuxubj.cn/images/201605/12.jpg)

### NexT主题简单配置
根据[NexT官方帮助文档](http://theme-next.iissnan.com/getting-started.html)，选择scheme为Mist，界面语言为zh-Hans，选择侧栏位置为right，侧栏显示时机为post,添加站点图像，作者昵称，站点描述等基本信息，效果如图：

![fig13](http://images.wuxubj.cn/images/201605/13.jpg)

至此，个人博客雏形基本显现，下一步进行优化。
