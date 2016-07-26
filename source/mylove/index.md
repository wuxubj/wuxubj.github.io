---
title: mylove
date: 2016-07-02 22:53:32
---
<link rel="stylesheet" href="http://o9w8f1xrl.bkt.clouddn.com/APlayer/APlayer.min.css">
<style type="text/css">
#lovelqw {
  background: #ffe;
  margin: 0px auto;
  text-align: center;
  padding: 0px;
  font-size: 15px;
  color: #9a8c8c;
}
.demo{width:340px; margin:0px auto 10px auto}.aplayer-music{line-height:18px;}.aplayer .aplayer-info .aplayer-controller .aplayer-time{bottom:0px;}
</style>

<script type="text/javascript">
//用到的函数在\themes\next\layout\_scripts\myscript\myscript.swig文件中
    setInterval("loveTime('2014/02/6 19:46:00')",1000);
    </script>

<blockquote class="blockquote-center"><div id="lovelqw">李小二和雷四能牵手走过了：
    <span id="t_d">00</span>天<span id="t_h">00</span>时<span id="t_m">00</span>分<span id="t_s">00</span>秒
<span id="loveYear">今天是第<span id="t_month">00</span>个月，第<span id="t_year">00</span>年 ！</span></div></blockquote><form><!--当点击相应按钮，执行相应操作，为按钮添加相应事件--><input type="button" id="bthidden" onclick="hideElement('music');showElement('btshow');hideElement('bthidden')" value="隐藏音乐" > <input type="button" id="btshow" class="hidden" onclick="showElement('music');showElement('bthidden');hideElement('btshow')" value="显示音乐" ></form><div class="demo" id="music"><div id="player3" class="aplayer"></div></div>
<script src="http://o9w8f1xrl.bkt.clouddn.com/APlayer/APlayer.min.js"></script>
    <script>
        var ap3 = new APlayer({
            element: document.getElementById('player3'),
            narrow: false,
            autoplay: true,
            showlrc: false,
            music: {
                title: '漂洋过海来看你',
                author: '李行亮',
                url: 'http://o9w8f1xrl.bkt.clouddn.com/APlayer/audio/%E6%BC%82%E6%B4%8B%E8%BF%87%E6%B5%B7%E6%9D%A5%E7%9C%8B%E4%BD%A0.mp3',
                pic: 'http://o9w8f1xrl.bkt.clouddn.com/APlayer/audio/5757042883105946.jpg'
            }
        });
        ap3.init();
    </script>

><span style="font-size: 15px;">[小游戏](http://o9w8f1xrl.bkt.clouddn.com/game/index.html)</span>