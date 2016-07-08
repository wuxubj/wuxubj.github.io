---
title: mylove
date: 2016-07-02 22:53:32
---
<style type="text/css">
#lovelqw {
  background: #ffe;
  margin: 0px auto;
  text-align: center;
  padding: 0px;
  font-size: 15px;
  color: #9a8c8c;
}
.hidden{display:none;}
</style>

<script type="text/javascript">
    function getRTime(){
        var EndTime= new Date('2014/02/6 19:46:00'); //截止时间 前端路上 http://www.51xuediannao.com/qd63/
        var NowTime = new Date();
        var t =NowTime.getTime() - EndTime.getTime();
        /*var d=Math.floor(t/1000/60/60/24);
        t-=d*(1000*60*60*24);
        var h=Math.floor(t/1000/60/60);
        t-=h*60*60*1000;
        var m=Math.floor(t/1000/60);
        t-=m*60*1000;
        var s=Math.floor(t/1000);*/

        var d=Math.floor(t/1000/60/60/24);
        var h=Math.floor(t/1000/60/60%24);
        var m=Math.floor(t/1000/60%60);
        var s=Math.floor(t/1000%60);
		var month=Math.ceil(d/30);
		var year=Math.ceil(d/365);

        document.getElementById("t_d").innerHTML = d + "天";
        document.getElementById("t_h").innerHTML = h + "时";
        document.getElementById("t_m").innerHTML = m + "分";
        document.getElementById("t_s").innerHTML = s + "秒";
		
		document.getElementById("t_month").innerHTML = month ;
		document.getElementById("t_year").innerHTML = year ;
    }
    setInterval(getRTime,1000);
//定义"隐藏内容"的函数
function hidcontent()
{
	var myele=document.getElementById("txt");
	myele.style.display="none";
	var myele=document.getElementById("btshow");
	myele.style.display="block";
	var myele=document.getElementById("bthidden");
	myele.style.display="none";
}

//定义"显示内容"的函数
function showcontent()
{
	var myele=document.getElementById("txt");
	myele.style.display="block";
	var myele=document.getElementById("bthidden");
	myele.style.display="block";
	var myele=document.getElementById("btshow");
	myele.style.display="none";
}
    </script>

<blockquote class="blockquote-center"><div id="lovelqw">李小二和雷四能牵手走过了：
    <span id="t_d">00天</span><span id="t_h">00时</span><span id="t_m">00分</span><span id="t_s">00秒</span>
<span id="loveYear">今天是第<span id="t_month">00</span>个月，第<span id="t_year">00</span>年 ！</span></div></blockquote><form><!--当点击相应按钮，执行相应操作，为按钮添加相应事件--><input type="button" id="bthidden" onclick="hidcontent()" value="隐藏音乐" > <input type="button" id="btshow" class="hidden" onclick="showcontent()" value="显示音乐" ></form><div id="txt" style="text-align: center;"><embed src="http://music.163.com/style/swf/widget.swf?sid=27836179&type=2&auto=1&width=320&height=66" width="340" height="86"  allowNetworking="all"></embed><div>
<br/>
><span style="font-size: 15px;">[小游戏](http://o9w8f1xrl.bkt.clouddn.com/game/index.html)</span>

