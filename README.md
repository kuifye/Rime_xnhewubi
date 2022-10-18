# rime-
xnhe_wubi-基于rime平台的小鹤五笔音形输入法，支持朙月字库和长句输入。
#
#-编码输入逻辑：小鹤编码+五笔编码。
#
#简码：
#1.音码+前两码
#	如：我 wo tr
#               拿 na wg
#               合 he wg
#2.音码+五笔首尾码
#	如：我 wo tt
#	       拿 na wr
#               合 he wf
#3.音码+五笔第一码、五笔第三码
#	如：骜 ao gc
#               合 he wk
#               动 ds fl
#4.音码第一码+五笔前两码
#	如：物 w tr
#               仅  j  w
#               伎  j  wc
#
# 简码可以参考reverse_lookup_xiaohe_wubi.dict.yaml
#
