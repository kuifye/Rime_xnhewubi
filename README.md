# rime-xnhe_wubi小鹤五笔音形无引导码
xnhe_wubi-小鹤双拼增强版
基于rime平台的小鹤五笔音形输入法，支持朙月字库和长句输入，挂载五笔形码作为辅助码，无引导码。

支持u+全拼开启拆字模式，如：骉umamama

单字编码逻辑：小鹤编码+五笔编码。

简码：
1.音码+前两码
2.音码+五笔首尾码
3.音码+五笔第一码、五笔第三码
4.音码第一码+五笔前两码

具体简码可以参考reverse_lookup_xiaohe_wubi.dict.yaml

支持语句流输入，实现类似顶功的输入功能。

#特殊编码

除了常用的编码外，另设置28组特殊简码。

現	xg 物	wt 任	rw 種	vt

鳳	fm 網	wm 實	up 僅	jw

央	ym 暗	aj 書	un 殺	uq

杉	us 矢	ut 仕	uw 紗	ux

子	zb 既	jvq 和	ht 妈	mv

阿	ab 哀	ay 峨	em 及	je

盎	am 以	yn 翼	ynl 華	hwx

详细编码见xnhe_wubi_codeExtend.txt及xnhe_wubi_charExtend.dict.yaml
