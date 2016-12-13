{% if page.copyright %}
{% if theme.copyright.enabled %}
<div class="post_copyright">
  <script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>
  <script type="text/javascript" src="http://jslibs.wuxubj.cn/sweetalert_mini/jquery-1.7.1.min.js"></script>
  <script src="http://jslibs.wuxubj.cn/sweetalert_mini/sweetalert.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://jslibs.wuxubj.cn/sweetalert_mini/sweetalert.mini.css">
  <p><span>本文标题:</span><a href="{{ url_for(page.path) }}">{{ page.title }}</a></p>
  <p><span>文章作者:</span><a href="/" title="访问 {{ theme.author }} 的个人博客">{{ theme.author }}</a></p>
  <p><span>发布时间:</span>{{ page.date.format("YYYY年MM月DD日 - HH:MM") }}</p>
  <p><span>最后更新:</span>{{ page.updated.format("YYYY年MM月DD日 - HH:MM") }}</p>
  <p><span>原始链接:</span><a href="{{ url_for(page.path) }}" title="{{ page.title }}">{{ page.permalink }}</a>
    <span class="copy-path"  title="点击复制文章链接"><i class="fa fa-clipboard" data-clipboard-text="{{ page.permalink }}"  aria-label="复制成功！"></i></span>
  </p>
  <p><span>许可协议:</span><i class="fa fa-creative-commons"></i> <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/" target="_blank" title="Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)">Attribution-NonCommercial 4.0</a> 转载请保留原文链接及作者。</p>  
</div>

<script> 
    var clipboard = new Clipboard('.fa-clipboard');
    clipboard.on('success', function(e) {
//	  var msg = e.trigger.getAttribute('aria-label');
//	  alert(msg);
//    console.info('Action:', e.action);
//    console.info('Text:', e.text);
//    console.info('Trigger:', e.trigger);
      e.clearSelection();
      });
	  
	clipboard.on('success', $(function(){
	  $(".fa-clipboard").click(function(){
		swal({   
		  title: "",   
		  text: '复制成功',   
		  html: false,
		  timer: 500,   
		  showConfirmButton: false
	    });
	  });
    }));  
</script>
{% endif %}
{% endif %}