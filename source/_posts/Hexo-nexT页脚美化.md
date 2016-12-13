---
title: Hexo+nexT页脚美化
date: 2016-07-06 11:27:10
categories: 
- 博客搭建
tags: 
- 页脚美化
- NexT
- Hexo
permalink: footer-beautify-of-nexT
copyright: true
---
<font color=#f00>本文为建站初期小结，查看完整建站教程：</font>[Hexo+nexT主题搭建个人博客](/2016/08/Hexo-nexT-build-personal-blog/)

>``Next``的``Mist``主题页脚默认``左对齐``，本文目标：
1.实现页脚元素``居中对齐``;
2.页脚添加cnzz站长统计并简单美化

<!--more-->
## 1. 页脚元素居中
修改``your blog\themes\next\source\css\_schemes\Mist\index.styl``文件，将``.footer-inner``中的``text-align: left;``修改为``text-align: center;``即可。

## 2. 页脚添加cnzz站长统计
>站点添加cnzz站长统计

参考：[添加CNZZ数据统计功能的支持（隐藏“站长统计”文字）](https://github.com/iissnan/hexo-theme-next/pull/712)
>修改``站长统计``显示位置

修改``your blog\themes\next\layout\_partials\footer.swig``文件，在``<div class="copyright" >``...``</div>``中添加如下代码：
```html
 {% if theme.cnzz_siteid %}
  <span class="site-pv">
    <script src="http://s6.cnzz.com/stat.php?id={{ theme.cnzz_siteid }}&web_id={{ theme.cnzz_siteid }}" type="text/javascript"></script>
	</span>
  {% endif %}
```
如图：
![添加代码](http://images.wuxubj.cn/images/201607/01.jpg)

## 3. 最终效果
![最终效果](http://images.wuxubj.cn/images/201607/02.jpg)