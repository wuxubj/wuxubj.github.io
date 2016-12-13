---
title: Hexo+nexT主题搭建个人博客
date: 2016-08-13 10:19:14
categories:
- 博客搭建
tags:
- Hexo
- NexT
permalink: Hexo-nexT-build-personal-blog
copyright: true
---
![Hexo](http://images.wuxubj.cn/201608/001.jpg)
## 1. Hexo简介
Hexo 是一款基于 Node.js 的静态博客框架。Hexo 使用 Markdown 解析文章，用户在本地安装Hexo并进行写作，通过一条命令，Hexo即可利用靓丽的主题自动生成静态网页。
参考：[Hexo Github地址](https://github.com/hexojs/hexo)                &nbsp;&nbsp;&nbsp;&nbsp;[Hexo帮助文档](https://hexo.io/zh-cn/docs/)<!--more-->
## 2. 博客环境搭建

### 2.1 安装Git
>**Windows平台：以 Win7 64位机为例**

到[官网](https://git-scm.com/download)下载 Git，一路默认选项安装。本文使用的是``Git-2.8.1-64-bit``，需要的用户可以[点此下载](http://obtvnlw7v.bkt.clouddn.com/Git-2.8.1-64-bit.exe) 。

>**Linux平台**

### 2.2 安装Node.js
>**Windows平台：以 Win7 64位机为例**

到[官网](http://nodejs.cn/download/)下载 Node.js，一路默认选项安装。本文使用的是``node-v4.4.2-x64``，需要的用户可以[点此下载](http://obtvnlw7v.bkt.clouddn.com/node-v4.4.2-x64.msi) 。

>**Linux平台**

### 2.3 安装Hexo
Git 和 Node.js 都安装好后,首先创建一个用于存放博客文件的文件夹，如 blog，然后进入 blog 文件夹，下面开始安装并使用 Hexo。

>**安装并初始化Hexo**

右键选择``Git Bash Here``，弹出``Git Bash``窗口；执行命令：
```bash
$ npm install -g hexo-cli
$ hexo init
```
安装完成后，指定文件夹的目录如下：
```Bash
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```
其中``_config.yml``文件用于存放网站的配置信息，你可以在此配置大部分的参数；``scaffolds``是存放模板的文件夹，当新建文章时，Hexo 会根据``scaffold``来建立文件；``source``是资源文件夹，用于存放用户资源，``themes``是主题文件夹，存放博客主题，Hexo 会根据主题来生成静态页面。

>**生成静态博客文件**

在``Git Bash``终端执行命令：
```Bash
$ hexo g
$ hexo s
```
Hexo将``source``文件夹中的Markdown 和 HTML 文件会被解析并放到``public``文件夹中，``public``文件夹用于存放静态博客文件，相当于网站根目录。
至此博客雏形基本完成，在浏览器中访问``http://localhost:4000/``，如图所示：

![002](http://images.wuxubj.cn/201608/002.jpg)

### 2.4 使用nexT主题
>**下载nexT主题**

在``Git Bash``终端执行以下命令：
```Bash
$ git clone https://github.com/iissnan/hexo-theme-next themes/next
```
解压所下载的压缩包至站点的 themes 目录下， 并将解压后的文件夹名称更改为 next 。本文使用``hexo-theme-next-5.0.1``，需要的用户可以[点此下载](https://github.com/iissnan/hexo-theme-next/archive/v5.0.1.zip) 。

>**启用nexT主题**

打开<font color=#f00>站点配置文件</font> ``_config.yml``，找到 theme 字段，并将其值更改为 next。
```yml
theme: next
```
在``Git Bash``终端执行命令``hexo s``，在浏览器中访问``http://localhost:4000/``，当你看到站点的外观与下图所示类似时即说明你已成功安装 NexT 主题。这是 NexT 默认的 Scheme —— Muse。

![003](http://images.wuxubj.cn/201608/003.jpg)
本博客使用的是``NexT.Pisces``主题，修改<font color=#f00>主题配置文件</font> ``_config.yml``的 Schemes 字段的值为：
```yml
scheme: Pisces
```
博客预览如图：

![004](http://images.wuxubj.cn/201608/004.jpg)

## 3. NexT主题配置
### 3.1 主题基本设定
参照[NexT使用文档](http://theme-next.iissnan.com/getting-started.html#theme-settings)，设置界面语言、菜单、侧栏、头像、作者昵称和站点描述。由于该使用文档描述非常详细，本文不再赘述。此处需要注意，<font color=#f00>添加新的菜单项时，需要手动创建该页面才能正常访问</font>，下面以分类页面为例讲述创建新页面的方法：

>**创建分类页面**

在``Git Bash``终端执行命令:
```Bash
$ hexo new page categories
```
>**编辑分类页面**

添加页面类型字段，将其值设置为 ``"categories"``，主题将自动为这个页面显示所有分类，如果有启用多说 或者 Disqus 评论，默认页面也会带有评论。需要关闭的话，请添加字段 ``comments`` 并将值设置为 ``false``。
```yml
title: 分类
date: 2014-12-22 12:39:04
type: "categories"
comments: false
---
```
创建标签页的方法同上，只需要将``type``字段设置为``"tags"``即可。

### 3.2 添加侧栏社交链接和友链
>**添加侧栏社交链接**

在<font color=#f00>主题配置文件</font> ``_config.yml``中`` Sidebar Settings``部分添加字段：
```yml
# Social Links
social:
  GitHub: https://github.com/wuxubj
  Weibo: http://weibo.com/wuxubj
```
本博客将侧栏社交链接设置居中显示，修改``themes\next\source\css\_common\components\sidebar\sidebar-author-links.styl``文件，添加如下样式：
<div class="codecopy codecopy0"> ```css <i class="fa fa-clipboard" data-clipboard-target=".codecopy0 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
.links-of-author-item {
  text-align: center;
  }
```
</div>
>**添加侧栏友情链接**

在<font color=#f00>主题配置文件</font> ``_config.yml``中`` Sidebar Settings``部分添加字段：
```yml
# Blogrolls
links_title: 友情链接
links_layout: inline
links_icon: link  # 设置图标
links:
  务虚笔记: http://www.wuxubj.cn
```
本博客侧栏友情链接使用了与侧栏社交链接相同的css样式，但文本左对齐。实现方法为：
修改``themes\next\layout\_macro\sidebar.swig``，将如下内容
<div class="codecopy codecopy1"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy1 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
<ul class="links-of-blogroll-list">
  {% for name, link in theme.links %}
    <li class="links-of-blogroll-item">
      <a href="{{ link }}" title="{{ name }}" target="_blank">
        {{ name }}
      </a>
    </li>
  {% endfor %}
</ul>
```
</div>修改为：
<div class="codecopy codecopy2"> ```cpp <i class="fa fa-clipboard" data-clipboard-target=".codecopy2 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
{% for name, link in theme.links %}
  <span class="links-of-author-item" style="text-align:left">
    <a href="{{ link }}" title="{{ name }}" target="_blank">
      {{ name }}
    </a>
  </span>
{% endfor %}
```
</div>
### 3.3 添加并美化本地搜索
很多 NexT 主题的博主都使用 Swiftype 搜索，但是 Swiftype 文章同步更新缓慢，且只有15天的试用期，用户体验很是不好。NexT 主题内置了本地站内搜索，但是其显示界面太过粗糙，本文对其进行了一些美化。下面是添加并美化本地搜索的具体方法。

>**安装并使用 hexo-generator-search**

``hexo-generator-search``插件用于生成博客索引数据，在站点的根目录下执行以下命令进行安装：
```Bash
$ npm install hexo-generator-search --save
```
编辑 <font color=#f00>站点配置文件</font> ``_config.yml``，新增以下内容到任意位置：
```yml
search:
  path: search.xml
  field: post
```
更多配置说明可到插件页面查看：[hexo-generator-search](https://github.com/PaicHyperionDev/hexo-generator-search)
至此，本地搜索功能已经完成，如图：

![localsearch](http://images.wuxubj.cn/201608/005.jpg)
可以看到，搜索弹窗界面比较粗糙，下面进行简单美化。

>**弹窗界面美化**

本地搜索的样式文件路径为``themes\next\source\css\_common\components\third-party\localsearch.styl``。本地搜索弹窗界面美化主要包括搜索输入显示、搜索结果关键字显示和搜索结果段落排版的美化，相关css样式为：
<div class="codecopy codecopy3"> ```css <i class="fa fa-clipboard" data-clipboard-target=".codecopy3 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
#local-search-input {
  margin-bottom: 10px;
  padding: 10px;
  width: 97%;
  font-size: 18px
}

.popup .fa-search{padding:8px 0;}

.search-keyword {
  border-bottom: 1px dashed #f00;
  font-size: 14px;
  font-weight: bold;
  color: #f00;
}

p.search-result {
  border-bottom: 1px dashed #ccc;
  padding: 5px 0 2px 0;
}

#local-search-result {
  height: 88%;
  overflow: auto;
}
```
</div>如果觉得输入框search图标太小，可以将其放大。修改``themes\next\layout\_partials\search\localsearch.swig``文件，将第二行的``<span class="search-icon fa fa-search"></span>``修改为：
```html
<span class="search-icon fa fa-search fa-lg"></span>
```
[点此查看](https://github.com/wuxubj/wuxubj.github.io/blob/hexo/themes/next/source/css/_common/components/third-party/localsearch.styl)我的``localsearch.styl``文件。
[点此查看](https://github.com/wuxubj/wuxubj.github.io/blob/hexo/themes/next/layout/_partials/search/localsearch.swig)我的``localsearch.swig``文件。

最终效果如图：

![localsearch](http://images.wuxubj.cn/201608/006.jpg)

### 3.4 使用多说
使用多说需要先到其[官网](http://duoshuo.com/)注册账户，并创建一个站点，获取你的``duoshuo_shortname``，如图：

![duoshuo_shortname](http://images.wuxubj.cn/201608/007.png)

>**添加多说评论**

在<font color=#f00>站点配置文件</font> ``_config.yml``中新增 ``duoshuo_shortname`` 字段，值设置成你的 duoshuo_shortname。

>**添加多说分享**

在<font color=#f00>站点配置文件</font> ``_config.yml``中添加字段 ``duoshuo_share``， 值为 ``true``。
```yml
# 多说
duoshuo_shortname: wuxubj
duoshuo_share: true
```
多说分享有个小bug，当点击“分享到”会出现“缺少service参数”提示，而且下拉分享按钮有些是undefined，这个bug可以通过在 duoshuo.swig 中引用多说开发版js ：embed.unstable.js来修复。修改后的[duoshuo.swig](https://github.com/wuxubj/hexo-theme-next/commit/96c2d5d9938fb233d9a64292e0f729b446c1af0f)。当然也可以通过删除部分代码，取消更多分享的功能来修复这个bug（我就是这么干的）。
最终效果如图：

![多说分享和多说评论](http://images.wuxubj.cn/201608/008.jpg)
>**添加多说最近访客**

在需要添加最近访客的网页对应的 markdown 文件中添加如下代码：
```html
>最近访客
<div class="ds-recent-visitors" data-num-items="28" data-avatar-size="42" id="ds-recent-visitors"></div>
```
然后到多说后台管理->设置->基本设置->自定义css中添加如下css样式：
<div class="codecopy codecopy4"> ```css <i class="fa fa-clipboard" data-clipboard-target=".codecopy4 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
#ds-reset .ds-avatar img,
#ds-recent-visitors .ds-avatar img {
width: 54px;
height: 54px;     /*设置图像的长和宽，这里要根据自己的评论框情况更改*/
border-radius: 27px;     /*设置图像圆角效果,在这里我直接设置了超过width/2的像素，即为圆形了*/
-webkit-border-radius: 27px;     /*圆角效果：兼容webkit浏览器*/
-moz-border-radius: 27px;
box-shadow: inset 0 -1px 0 #3333sf;     /*设置图像阴影效果*/
-webkit-box-shadow: inset 0 -1px 0 #3333sf;
-webkit-transition: 0.4s;
-webkit-transition: -webkit-transform 0.4s ease-out;
transition: transform 0.4s ease-out;     /*变化时间设置为0.4秒(变化动作即为下面的图像旋转360读）*/
-moz-transition: -moz-transform 0.4s ease-out;
}

#ds-reset .ds-avatar img:hover,
#ds-recent-visitors .ds-avatar img:hover {

/*设置鼠标悬浮在头像时的CSS样式*/    box-shadow: 0 0 10px #fff;
rgba(255, 255, 255, .6), inset 0 0 20px rgba(255, 255, 255, 1);
-webkit-box-shadow: 0 0 10px #fff;
rgba(255, 255, 255, .6), inset 0 0 20px rgba(255, 255, 255, 1);
transform: rotateZ(360deg);     /*图像旋转360度*/
-webkit-transform: rotateZ(360deg);
-moz-transform: rotateZ(360deg);
}
/*
#ds-thread #ds-reset .ds-textarea-wrapper textarea {
background: url(http://www.wuxubj.cn/images/duoshuo_bkground.jpg) right no-repeat;
}
*/
#ds-recent-visitors .ds-avatar {
float: left
}
/*隐藏多说底部版权*/
#ds-thread #ds-reset .ds-powered-by {
display: none;
}
```
</div>效果如图：

![多说最近访客](http://images.wuxubj.cn/201608/009.jpg)

### 3.5 添加cnzz站长统计
>**添加站长统计**

到[友盟+](https://i.umeng.com/signup?spm=0.0.0.0.ma5nae)注册账户，并添加自己的网站域名，获取到一个站点ID，这个ID可以在地址栏里，或者自动生成的脚本里面找到。
在<font color=#f00>主题配置文件</font> ``_config.yml``中添加如下字段：
```yml
# CNZZ count
cnzz_siteid: 1259784696
```
注意把字段``cnzz_siteid``的值修改为你自己的站点ID。
修改``themes\next\layout\_layout.swig``文件，添加如下内容，用于生成cnzz统计代码：
```yml
{% include '_scripts/third-party/analytics/cnzz-analytics.swig' %}
```
至此cnzz站长统计功能已经添加。<font color=#f00>由于默认默认不显示“站长统计”字样，所以从页面外观看不到任何变化。</font>

>**页脚添加“站长统计”链接**

修改``\themes\next\layout\_partials\footer.swig``文件，在``<span class="author" itemprop="copyrightHolder">{{ config.author }}</span>``后面添加如下代码：
<div class="codecopy codecopy5"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy5 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
{% if theme.cnzz_siteid %}
   <span style="margin-left:8px;">
   <script src="http://s6.cnzz.com/stat.php?id={{ theme.cnzz_siteid }}&web_id={{ theme.cnzz_siteid }}" type="text/javascript"></script>
   </span>
{% endif %}
```
</div>最终效果如图：

![cnzz](http://images.wuxubj.cn/201608/010.jpg)

### 3.6 设置404页面
刚开始使用腾讯404公益页面，但是移动端适配不好，遂弃之。我现在的[404页面](/404.html)对应的markdown文件内容为：
<div class="codecopy codecopy6"> ```markdown <i class="fa fa-clipboard" data-clipboard-target=".codecopy6 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
---
title: 404-找不到页面
date: 2016-05-21 18:53:59
comments: false
permalink: /404
---


<center>404 Not Found<center>
-------
<center>**对不起，您所访问的页面不存在或者已删除**
你可以**[点击此处](http://www.wuxubj.cn)**返回首页。
你也可以<a href="#" class="popup-trigger">**点击此处**</a>重新搜索结果。</center>
![网站二维码](/images/wuxubj_mini.png)<center>扫一扫，用手机访问本站<center>
```
</div>效果如下图所示：

![404页面](http://images.wuxubj.cn/201608/011.jpg)

## 4. 网站发布
### 4.1 云主机
学生党推荐参加腾讯云[云+校园](https://www.qcloud.com/act/campus)优惠活动，云主机+CN域名只需1元/月。
工作党建议花钱购买云主机，个人博客选择最便宜的就行，一年几百元人民币。

### 4.2 Git托管的Pages服务
常用的有[GitHub pages](https://pages.github.com/)和[Coding Pages](https://coding.net/)。
GitHub pages 的使用教程参见：[GitHub Pages + Hexo搭建博客](http://crazymilk.github.io/2015/12/28/GitHub-Pages-Hexo搭建博客/)    [Hexo 3.1.1 静态博客搭建指南](http://lovenight.github.io/2015/11/10/Hexo-3-1-1-静态博客搭建指南/)
Coding Pages 的使用教程参见：[将hexo博客同时托管到github和coding](http://www.jianshu.com/p/7ad9d3cd4d6e)

我刚开始建站的时候使用的是``GitHub pages``，后来也部署到了``Coding``，但访问速度都不咋令人满意。最后我选择了腾讯云主机，顿时感觉访问速度飞快。
## 5. NexT主题美化

### 5.1 修改导航栏图标
NexT 使用的是 [Font Awesome](http://fontawesome.io/) 提供的图标， Font Awesome 提供了 600+ 的图标，可以满足绝大的多数的场景，同时无须担心在 Retina 屏幕下 图标模糊的问题。对应的文件在``themes\next\source\vendors\font-awesome``中。
在[http://fontawesome.dashgame.com/](http://fontawesome.dashgame.com/)中有图标与其名称的对应，用户可根据需要修改图标。我的``menu_icons``配置为：
```yml
menu_icons:
  enable: true
  #KeyMapsToMenuItemKey: NameOfTheIconFromFontAwesome
  home: home
  about: user
  categories: th
  tags: tags
  archives: calendar-check-o
  commonweal: heartbeat
  guestbook: envelope
  mylove: heart

```
### 5.2 修改文章内链接文本样式
将链接文本设置为蓝色，鼠标划过时文字颜色加深，并显示下划线。
修改文件``themes\next\source\css\_common\components\post\post.styl``，添加如下css样式，：
<div class="codecopy codecopy7"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy7 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
.post-body p a{
  color: #0593d3;
  border-bottom: none;

  &:hover {
    color: #0477ab;
    text-decoration: underline;
  }
}

```
</div>选择``.post-body``是为了不影响标题，选择``p``是为了不影响首页“阅读全文”的显示样式。
### 5.3 文章末尾添加“本文结束”标记
![本文结束标记](http://images.wuxubj.cn/201608/012.jpg)
>**新建 passage-end-tag.swig 文件**

在路径``\themes\next\layout\_macro``中添加``passage-end-tag.swig``文件，其内容为：
<div class="codecopy codecopy8"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy8 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
{% if theme.passage_end_tag.enabled %}
<div style="text-align:center;color: #ccc;font-size:14px;">
------ 本文结束 ------</div>
{% endif %}
```
</div>
>**修改 post.swig 文件**

在``\themes\next\layout\_macro\post.swig``中，``post-body``之后，``post-footer``之前添加如下代码：
<div class="codecopy codecopy9"> ```yml <i class="fa fa-clipboard" data-clipboard-target=".codecopy9 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
<div>
  {% if not is_index %}
    {% include 'passage-end-tag.swig' %}
  {% endif %}
</div>
```
</div>
>**在主题配置文件中添加字段**

在<font color=#f00>主题配置文件</font> ``_config.yml``中添加以下字段开启此功能：
```yml
# 文章末尾添加“本文结束”标记
passage_end_tag:
  enabled: true
```
完成以上设置之后，在每篇文章之后都会添加“本文结束”标记。
该功能简易添加方法参见：[Issues of hexo-theme-next](https://github.com/iissnan/hexo-theme-next/issues/1039)

### 5.4 文章末尾添加网站二维码
利用 NexT 主题自带的``wechat_subscriber``功能在文章末尾添加网站二维码。
首先生成你网站的二维码，放到网站根目录下的``images``文件夹中，然后修改<font color=#f00>主题配置文件</font> ``_config.yml``，添加如下内容：
```yml
# Wechat Subscriber
wechat_subscriber:
  enabled: true
  qcode: /images/wuxubj.png
  description: 扫一扫，用手机访问本站
```
完成以上设置之后，在每篇文章之后都会添加网站二维码。

### 5.5 手机端site-subtitle显示优化
手机端默认显示副标题，个人觉得不太美观，现修改为：默认不显示副标题，显示导航栏的同时显示副标题。效果如图：
![site-subtitle](http://images.wuxubj.cn/201608/013.gif)
原理：编写JavaScript函数，根据导航栏的``display``属性来决定是否显示副标题，实现方法如下：

>**给导航栏添加id并隐藏site-subtitle**

在``themes\next\layout\_partials\header.swig``中找到``<nav class="site-nav">``，为其添加id。大概在第29行，将其修改为：
```html
<nav class="site-nav" id="site-nav">
```
设置手机端默认不显示网站副标题。在``themes\next\source\css\_common\components\header\site-meta.styl``中添加如下样式：
<div class="codecopy codecopy11"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy11 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
.site-subtitle{
+mobile() {
    display: none;
  }
}
```
</div>
>**编写JavaScript函数**

<div class="codecopy codecopy10"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy10 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
</script>
<script type="text/JavaScript">
function showSubtitle()
{
  var siteNav=document.getElementById("site-nav");
  if(siteNav.style.display=="block")
  {
   var subTitle=document.getElementById("site-subtitle");
   subTitle.style.display="none";
  }else
  {
   var subTitle=document.getElementById("site-subtitle");
   subTitle.style.display="block";
  }

}
</script>

```
</div>将其放到任意一个``*.swig``文件中，在``_layout.swig``中引入即可。我的处理方法是，在``themes\next\layout\_scripts\``文件夹中新建``myscript``文件夹，专门用于存放自己添加的JavaScript代码。在里面创建一个``myscript.swig``文件，将上述代码copy到里面，再在``themes\next\layout\_layout.swig``中添加如下代码引入：
```yml
{% include '_scripts/myscript/myscript.swig' %}
```
[点击](https://github.com/wuxubj/wuxubj.github.io/blob/hexo/themes/next/layout/_layout.swig)查看我的``_layout.swig``文件。
>**点击网站标题旁边的按钮时触发JavaScript函数**

在``themes\next\layout\_partials\header.swig``中给``<button></button>``添加 onclick 事件：
<div class="codecopy codecopy12"> ```html <i class="fa fa-clipboard" data-clipboard-target=".codecopy12 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
<button onclick="showSubtitle()">
  <span class="btn-bar"></span>
  <span class="btn-bar"></span>
  <span class="btn-bar"></span>
</button>
```
</div>[点击](https://github.com/wuxubj/wuxubj.github.io/blob/hexo/themes/next/layout/_partials/header.swig)查看我的``header.swig``文件。

### 5.6 其他美化
1.标签云页面鼠标划过字体加粗
2.文章末尾标签鼠标划过变蓝色
3.调换文章末尾上一篇和下一篇链接显示位置（左右互换）
4.优化文章末尾上一篇和下一篇链接显示效果

## 6. SEO推广

### 6.1 生成sitemap
Sitemap用于通知搜索引擎网站上有哪些可供抓取的网页，以便搜索引擎可以更加智能地抓取网站。
执行以下命令，安装插件``hexo-generator-sitemap``，用于生成``sitemap``：
```Bash
$ npm install hexo-generator-sitemap --save
```
在<font color=#f00>站点配置文件</font> ``_config.yml``中添加如下字段：
```yml
sitemap:
path: sitemap.xml
```
执行``hexo g``，就会在网站根目录生成 sitemap.xml 。

### 6.2 添加 robots.txt
网站通过Robots协议告诉搜索引擎哪些页面可以抓取，哪些页面不能抓取。robots.txt 通常存放于网站根目录。我的 robots.txt 内容为：
<div class="codecopy codecopy13"> ```txt <i class="fa fa-clipboard" data-clipboard-target=".codecopy13 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
User-agent: *
Allow: /
Allow: /archives/
Allow: /categories/
Allow: /tags/
Allow: /guestbook/
Allow: /mylove/
Allow: /weblog/
Allow: /page/
Allow: /2016/

Disallow: /vendors/
Disallow: /js/
Disallow: /css/
Disallow: /fonts/
Disallow: /vendors/
Disallow: /fancybox/

Sitemap: http://wuxubj.cn/sitemap.xml
```
</div>
### 6.3 开启百度自动推送
在<font color=#f00>主题配置文件</font> ``_config.yml``中添加如下字段：
```yml
baidu_push: true
```
### 6.4 使用各大搜索引擎站长工具
在搜索引擎搜索框输入``site:your.domain``可以查看域名是否被该搜索引擎收录，用户可以使用各大搜索引擎站长工具提交个人博客网址。

## 7. 博客维护
后期更新

## 8. 相关资源
[我的站点文件备份](https://github.com/wuxubj/wuxubj.github.io)
[优化之后的NexT主题下载](https://github.com/wuxubj/hexo-theme-next-wuxubj/releases)
[hexo-theme-next-5.0.1](http://obtvnlw7v.bkt.clouddn.com/hexo-theme-next-5.0.1.zip)
[markdownpad2](http://obtvnlw7v.bkt.clouddn.com/markdownpad2-setup.exe)
[Notepad++ v6.9.2](http://sw.bos.baidu.com/sw-search-sp/software/22de65944e9/npp_6.9.2_Installer.exe)
[Git-2.8.1-64-bit](http://obtvnlw7v.bkt.clouddn.com/Git-2.8.1-64-bit.exe)
[node-v4.4.2-x64](http://obtvnlw7v.bkt.clouddn.com/node-v4.4.2-x64.msi)

## 9. 参考文献
[NexT官方文档](http://theme-next.iissnan.com/theme-settings.html)
[Issues of hexo-theme-next](https://github.com/iissnan/hexo-theme-next/issues)
[Hexo官方文档](https://hexo.io/zh-cn/docs/index.html)
[w3school](http://www.w3school.com.cn/)