function hideElement(elementID)
{
	var myele=document.getElementById(elementID);
	myele.style.display="none";
}

function showElement(elementID)
{
	var myele=document.getElementById(elementID);
	myele.style.display="block";
}

function loveTime(startDate){
     //   var EndTime= new Date('2014/02/6 19:46:00'); //截止时间 前端路上 http://www.51xuediannao.com/qd63/
        var EndTime= new Date(startDate); 
		var NowTime = new Date();
        var t =NowTime.getTime() - EndTime.getTime();

        var d=Math.floor(t/1000/60/60/24);
        var h=Math.floor(t/1000/60/60%24);
        var m=Math.floor(t/1000/60%60);
        var s=Math.floor(t/1000%60);
		var month=Math.ceil(d/30);
		var year=Math.ceil(d/365);
        document.getElementById("t_d").innerHTML = d ;
        document.getElementById("t_h").innerHTML = h ;
        document.getElementById("t_m").innerHTML = m ;
        document.getElementById("t_s").innerHTML = s ;
		
		document.getElementById("t_month").innerHTML = month ;
		document.getElementById("t_year").innerHTML = year ;
    }

setInterval("loveTime('2014/02/6 19:46:00')",1000);

function imgStop(strid){
var a = document.getElementById(strid);
a.style["animation"]="cycle 0s 0s infinite";
a.style["border-radius"]="0";
}

function imgStart(strid){
var a = document.getElementById(strid);
a.style["border-radius"]="100%";
a.style["animation"]="cycle 2s 0.5s infinite";
a.style["transition"]="border-radius 2s";
}

var ap3 = new APlayer({
            element: document.getElementById('player3'),
            narrow: false,
            autoplay: true,
            showlrc: false,
            music: {
                title: '漂洋过海来看你',
                author: '李行亮',
                url: 'http://media.wuxubj.cn/%E6%BC%82%E6%B4%8B%E8%BF%87%E6%B5%B7%E6%9D%A5%E7%9C%8B%E4%BD%A0.mp3',
                pic: 'http://media.wuxubj.cn/5757042883105946.jpg'
            }
        }); 
		ap3.init();
