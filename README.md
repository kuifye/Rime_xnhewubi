# rime-xnhe_wubi小鹤五笔音形直接辅助码
xnhe_wubi-小鹤双拼增强版
基于rime平台的小鹤五笔音形输入法，支持朙月字库和长句输入，挂载五笔形码作为辅助码，无引导码。

# 简单介绍

u+全拼开启拆字模式，如：骉umamama

o开启五笔反查模式，如：百odj

单字编码逻辑：小鹤编码+五笔编码。（通常为首尾码）

简码：
1.音码+前两码
2.音码+五笔首尾码
3.音码+五笔第一码、五笔第三码
4.音码第一码+五笔前两码

具体简码可以参考reverse_lookup_xiaohe_wubi.dict.yaml

支持语句流输入，可实现类似顶功的连续输入功能。

# 反犬旁
为了不影响双拼整句输入，反犬旁由qt改成qo。
例如“狄”如果编码diqt，则和“的确”冲突。而diqo，则不会影响整句输入。

# 特殊编码

除了常用的编码外，另设置30组特殊简码。（可不使用）

現	xg 物	wt 任	rw 種	vt

鳳	fm 網	wm 實	up 僅	jw

央	ym 暗	aj 書	un 殺	uq

杉	us 矢	ut 仕	uw 紗	ux

子	zb 既	jv 和	ht 妈	mv

阿	ab 哀	ay 峨	em 及	je 幽 yx

盎	am 以	yn 翼	ynl 華	hwx 为 wy

详细编码见xnhe_wubi_codeExtend.txt及xnhe_wubi_charExtend.dict.yaml

# 一级简码（数字固定在次候选位）

啊	a
阿	a

不	b
八	b

纔	c
此	c

的	d
帝	d

而	e
二	e

發	f
非	f

個	g
工g

和	h
花	h

出	i
乘	i

就	j
九	j

可	k
康	k

了	l
六	l

沒	m
漠	m

你	n
廿	n

哦	o
喔	o

平	p
蘋	p

去	q
七	q

人	r
入	r

所	s
三	s

他	t
它	t

是	u
十	u

這	v
之	v

我	w
五	w

小	x
心	x

以	y
一	y

在	z
子	z

二三级简码详见xiaohe_wubi_code.txt
