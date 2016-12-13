---
title: Hexo搭建个人博客(进阶篇)
date: 2016-05-21 16:01:28
categories:
- 博客搭建
tags:
- Hexo
- NexT
permalink: Hexo-build-personal-blog-advance 
copyright: true
---
<font color=#f00>本文为建站初期小结，查看完整建站教程：</font>[Hexo+nexT主题搭建个人博客](/2016/08/Hexo-nexT-build-personal-blog/)

记录了nexT主题的美化，包括添加分类和标签页、添加swiftype搜索、导航栏美化、添加留言页面及最近访客以及添加404公益页面。
<!--more-->
### 添加分类和标签页
1.新建一个页面，命名为``categories`` ，命令如下:
``` bash
$ hexo new page categories
```
2.编辑刚新建的页面，将页面的类型设置为``categories``，主题将自动为这个页面显示所有分类。
``` bash
title: 分类
date: 2014-12-22 12:39:04
type: "categories"
comments: false
---
```
3.在菜单中添加链接。编辑主题的 ``_config.yml`` ，将`` menu`` 中的 ``categories: /categories`` 注释去掉，如下:
``` bash
menu:
  home: /
  categories: /categories
  archives: /archives
  tags: /tags
```
如果按照以上步骤，分类页面无法正常显示各分类项，请检查相应``index.md``文件中是否添加了``type``字段，如果已添加``type``字段分类仍然无法显示，请检查文章是否存在分类。
搬运于[创建分类页面](https://github.com/iissnan/hexo-theme-next/wiki/创建分类页面)
同理可以[添加标签页面](https://github.com/iissnan/hexo-theme-next/wiki/创建标签云页面)。

### 添加swiftype搜索并自定义搜索框
1.参考：[Swiftype 站内搜索](http://theme-next.iissnan.com/third-party-services.html#swiftype) 在导航栏添加搜索按钮。如图：

![fig21](http://images.wuxubj.cn/images/201605/21.jpg)

2.添加搜索框。我们希望搜索界面是这样的：

![fig22](http://images.wuxubj.cn/images/201605/22.jpg)

具体操作如下：
编辑路径``\themes\next\source\css\_schemes\Mist``下的``_search.styl``文件，添加如下样式：
<div class="codecopy codecopy1"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy1 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
.site-search {
  display: block;
  float: right;
  margin-top: 8px;
}

.site-search form {
  display: block;
  margin-top: 0em;
}

.site-search input {
    padding: 3px;
    border: none;
    padding-left: 18px;
    border-radius: 0;
    width: 140px;
    background:url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjwhRE9DVFlQRSBzdmcgIFBVQkxJQyAnLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4nICAnaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkJz48c3ZnIGhlaWdodD0iMTZweCIgaWQ9IkxheWVyXzEiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDE2IDE2OyIgdmVyc2lvbj0iMS4xIiB2aWV3Qm94PSIwIDAgMTYgMTYiIHdpZHRoPSIxNnB4IiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj48cGF0aCBkPSJNMTUuNywxNC4zbC0zLjEwNS0zLjEwNUMxMy40NzMsMTAuMDI0LDE0LDguNTc2LDE0LDdjMC0zLjg2Ni0zLjEzNC03LTctN1MwLDMuMTM0LDAsN3MzLjEzNCw3LDcsNyAgYzEuNTc2LDAsMy4wMjQtMC41MjcsNC4xOTQtMS40MDVMMTQuMywxNS43YzAuMTg0LDAuMTg0LDAuMzgsMC4zLDAuNywwLjNjMC41NTMsMCwxLTAuNDQ3LDEtMUMxNiwxNC43ODEsMTUuOTQ2LDE0LjU0NiwxNS43LDE0LjN6ICAgTTIsN2MwLTIuNzYyLDIuMjM4LTUsNS01czUsMi4yMzgsNSw1cy0yLjIzOCw1LTUsNVMyLDkuNzYyLDIsN3oiLz48L3N2Zz4=") no-repeat 0 50%;
    background-size: 12px 12px;
    outline: none;
    border-bottom: 1px solid #999;
    opacity: 0.5;
}
```
</div>编辑路径``\themes\next\source\css\_schemes\Mist``下的``_menu.styl``文件，添加如下样式：
<div class="codecopy codecopy2"> ```cpp <i class="fa fa-clipboard" data-clipboard-target=".codecopy2 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
.menu {
  float: left;
  margin: 8px 0 0 20px;
  padding: 0 20px;
}
```
</div>效果如下图所示：

![fig23](http://images.wuxubj.cn/images/201605/23.jpg)

3.去掉导航栏搜索按钮
编辑路径``\themes\next\layout\_partials``下的``header.swig``文件，去掉红色框内的代码，如图：

![fig24](http://images.wuxubj.cn/images/201605/24.jpg)

最终效果为：

![fig25](http://images.wuxubj.cn/images/201605/25.jpg)

### 增大导航栏高度
编辑路径``\themes\next\source\css\_schemes\Mist``下的``_header.styl``文件，修改样式：
<div class="codecopy codecopy3"> ```cpp <i class="fa fa-clipboard" data-clipboard-target=".codecopy3 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
.header-inner {
  padding: 40px 0;
  margin-bottom: 80px;
  clearfix();
}
```
</div>效果如图：

![fig26](http://images.wuxubj.cn/images/201605/26.jpg)

### 添加留言页面及最近访客
1.参考：[多说评论](http://theme-next.iissnan.com/getting-started.html#comment-system-duoshuo)完成基本配置实现多说评论。
2.新建留言页面guestbook: ``hexo new page guestbook`` ,在主题配置文件``_config.yml``的``menu``项中添加``guestbook: /guestbook``,即：
```
menu:
  home: /
  categories: /categories
  #about: /about
  archives: /archives
  tags: /tags
  guestbook: /guestbook
  #commonweal: /404.html
```
3.在``\themes\next\languages\zh-Hans.yml``中``menu``项中添加``guestbook: 留言``字段,即：
```
menu:
  home: 首页
  archives: 归档
  categories: 分类
  tags: 标签
  about: 关于
  search: 搜索
  guestbook: 留言
  commonweal: 公益404
```
4.编辑``yourblog\source\guestbook\index.md``文件，添加如下内容：
```
<blockquote class="blockquote-center">自定义你的签名</blockquote>
<br/>
>最近访客
<div class="ds-recent-visitors" data-num-items="28" data-avatar-size="42" id="ds-recent-visitors"></div>

```
### 添加404公益页面
1.新建404页面: ``hexo new page 404``。
2.打开对应的md文件，添加如下代码：
```
<body><script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone_v6/lostchild/search_children.js" charset="utf-8"></script></body>
```
效果如图：
![fig27](http://images.wuxubj.cn/images/201605/27.jpg)