---
title: matlab添加噪声和计算信号信噪比
date: 2016-05-26 20:49:23
categories:
- 数据处理基础
tags:
- matlab
- 数据处理
permalink: matlab-add-noise-calculating-signal-to-noise-ratio
copyright: true
---
本文讲述Matlab中计算信号信噪比以及在信号中添加高斯白噪声的方法。
<!--more-->
## 1. 计算信噪比(SNR)
>**计算信号功率**

```matlab
sigPower = sum(abs(sig(:)).^2)/length(sig(:))
```
>**计算信噪比（SNR）**

```matlab
SNR(dB)=10*log10(Ps/Pn)
```
>**相关单位**

**分贝(decibel, dB)：**分贝（dB）是表示相对功率或幅度电平的标准单位，换句话说，就是我们用来表示两个能量之间的差别的一种表示单位，它不是一个绝对单位。例如，电子系统中将电压、电流、功率等物理量的强弱通称为电平，电平的单位通常就以分贝表示，即事先取一个电压或电流作为参考值（0dB），用待表示的量与参考值之比取对数，再乘以20作为电平的分贝数（功率的电平值改乘10）。
**分贝瓦(dBW, dB Watt)：**指以1W的输出功率为基准时，用分贝来测量的功率放大器的功率值。
**dBm (dB-milliWatt)：**即与1milliWatt（毫瓦）作比较得出的数字。
```
0 dBm = 1 mW
10 dBm = 10 mW
20 dBm = 100 mW
```
## 2. AWGN：在某一信号中加入高斯白噪声
``y = awgn(x,SNR)`` 在信号x中加入高斯白噪声。信噪比SNR以dB为单位。x的强度假定为0dBW。如果x是复数，就加入复噪声。
``y = awgn(x,SNR,SIGPOWER)`` 如果SIGPOWER是数值，则其代表以dBW为单位的信号强度；如果SIGPOWER为'measured'，则函数将在加入噪声之前测定信号强度。
``y = awgn(x,SNR,SIGPOWER,STATE)`` 重置RANDN的状态。
``y = awgn(…,POWERTYPE)`` 指定SNR和SIGPOWER的单位。POWERTYPE可以是'dB'或'linear'。如果POWERTYPE是'dB'，那么SNR以dB为单位，而SIGPOWER以dBW为单位。如果POWERTYPE是'linear'，那么SNR作为比值来度量，而SIGPOWER以瓦特为单位。
示例：
<div class="codecopy codecopy1"> ```matlab <i class="fa fa-clipboard" data-clipboard-target=".codecopy1 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
close all;clear all;clc
f=100;
fs=1000;
snr=5;
t=0:1/fs:1-1/fs;
x=sin(2*pi*f.*t);
Ps=sum(abs(x(:)).^2)/length(x(:));%计算信号功率

y1=awgn(x,snr,'measured','dB');%以分布为单位，此时snr=10*log10(Ps/Pn)
noise=y1-x;
Pn=sum(abs(noise(:)).^2)/length(noise(:));
snr_out1=10*log10(Ps/Pn);

y2=awgn(x,snr,'measured','linear');%用比值度量，此时snr=Ps/Pn
noise=y2-x;
Pn=sum(abs(noise(:)).^2)/length(noise(:));
snr_out2=Ps/Pn;

figure
subplot(211)
plot(t,x);
xlabel('t');
title('标准正弦信号x');
subplot(212);
plot(t,y1);
xlabel('t');
title('加入高斯白噪声后的信号(SNR=5)');
```
</div>加入的高斯白噪声是随机的，所以``snr_out1``和``snr_out2``在``snr=5``上下波动。波形如图：
![fig31](http://images.wuxubj.cn/images/201605/31.jpg)
**参考文献：**
[1] [matlab中的信噪比](http://blog.sina.com.cn/s/blog_758ebadc0100qchy.html)
[2] [Matlab信号上叠加噪声和信噪比的计算](http://www.ilovematlab.cn/thread-54155-1-1.html)