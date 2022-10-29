# rime-xnhe_wubi小鹤五笔音形无引导码
xnhe_wubi-小鹤双拼增强版
基于rime平台的小鹤五笔音形输入法，支持朙月字库和长句输入，挂载五笔形码作为辅助码，无引导码。

支持u+全拼开启拆字模式，如：骉umamama

单字编码逻辑：小鹤编码+五笔编码。（通常为首尾码）

简码：
1.音码+前两码
2.音码+五笔首尾码
3.音码+五笔第一码、五笔第三码
4.音码第一码+五笔前两码

具体简码可以参考reverse_lookup_xiaohe_wubi.dict.yaml

支持语句流输入，可实现类似顶功的连续输入功能。

# 特殊编码

除了常用的编码外，另设置28组特殊简码。

現	xg 物	wt 任	rw 種	vt

鳳	fm 網	wm 實	up 僅	jw

央	ym 暗	aj 書	un 殺	uq

杉	us 矢	ut 仕	uw 紗	ux

子	zb 既	jvq 和	ht 妈	mv

阿	ab 哀	ay 峨	em 及	je

盎	am 以	yn 翼	ynl 華	hwx

详细编码见xnhe_wubi_codeExtend.txt及xnhe_wubi_charExtend.dict.yaml

# 一级简码（数字固定在次候选位）

啊	a	9
阿	a	8
不	b	9
八	b	8
纔	c	9
此	c	8
的	d	9
帝	d	8
而	e	9
二	e	8
發	f	9
非	f	8
個	g	9
國	g	8
和	h	9
花	h	8
出	i	9
乘	i	8
就	j	9
九	j	8
可	k	9
康	k	8
了	l	9
六	l	8
沒	m	9
漠	m	8
你	n	9
廿	n	8
哦	o	9
喔	o	8
平	p	9
蘋	p	8
去	q	9
七	q	8
人	r	9
入	r	8
所	s	9
三	s	8
他	t	9
它	t	8
是	u	9
十	u	8
這	v	9
之	v	8
我	w	9
五	w	8
小	x	9
香	x	8
卌	x	7
以	y	9
一	y	8
在	z	9
子	z	8
