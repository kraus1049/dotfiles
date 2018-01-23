# スイッチ変数 {{{
# 0 : 普通のプロット , 1 : 文字を大きめにプロット
plotsize = 0

# 0 : gridなし,1 : gridあり
use_grid = 0

# 0 : xticsなし,1 : xticsあり
use_xtics = 1

# 0 : yticsなし,1 : yticsあり
use_ytics = 1

# 0 : x2axisなし,1 : x2axisあり
use_x2axis = 0

# 0 : y2axisなし,1 : y2axisあり
use_y2axis = 0

# sleepの秒数
sleep_time = 0

# 0 : 判例なし, 1 : 判例あり
use_key = 0
# }}}


if(plotsize) { # {{{
	graph_size = "LARGE"
	set key spacing 1.5
	set xlabel offset 0,-1
	set ylabel offset -1,0
	set cblabel offset 1,0
	set lmargin 10
	set rmargin 0
	set tmargin 0
} else {
	graph_size = ""
	set lmargin 0
	set rmargin 0
	set tmargin 0
} # }}}

# データはCSV形式を仮定
set datafile separator ","
# 欠損値はNanであると仮定
set datafile missing "Nan"

set terminal "x11"

# grid {{{
if(use_grid) {
	set grid
}else{
	unset grid
}
# }}}

# 黄金比
set size ratio 0.618047


# 判例 =============================={{{
if(use_key){
	unset key
}else{
	# left or right
	# top or center or bottom
	# reverse

	set key right top
}
# ===================================}}}

# x axis ================================={{{
set xlabel "{{_input_:xlabel}}"

if(use_xtics){
	set xtics
}else{
	unset xtics
}

set xrange [{{_input_:xStart}}:{{_input_:xEnd}}]
# =================================================}}}

# y axis ============================={{{
set ylabel "{{_input_:ylabel}}"

if(use_ytics){
	set ytics
}else{
	unset ytics
}

set yrange [{{_input_:yStart}}:{{_input_:yEnd}}]
# =================================================}}}

# x2 axis ========================================={{{
if(use_x2axis){
	set x2label "hoge"
	set x2tics
	set x2range [1:2]
}
# =================================================}}}

# x2 axis ========================================={{{
if(use_x2axis){
	set x2label "x2label"
	set x2tics
	set x2range [1:2]
}
# =================================================}}}

# y2 axis ========================================={{{
if(use_y2axis){
	set y2label "y2label"
	set y2tics
	set y2range [1:2]
}
# =================================================}}}

# グラフ中に線が引きたければ======================={{{

# set arrow 1 from 0.15,15 to 0.85,15 nohead lw 2 dt (10,5)\
#  lc rgb "black"

# secondをつければx2,y2axisが使える
# set arrow 2 from second 120.0,0 to second 610.0,0 nohead lw 2 dt (10,5)\
#  lc rgb "red"
# =================================================}}}

# {{{ datafile
# smooth sbezier csplines etc. は使用注意

# red,#9e8e2a,web-green,blue,black

datfile = "{{_cursor_}}"
plot datfile using 1:2 with lines\
 lw 5 linecolor "black"  title "判例1"

# 複数のデータファイルからプロットするときはdatfileやめたほうがいい
# replot "" using 1:2 with lines\
#  lw 5 linecolor "black"  title "判例1"
# }}}

# eps_output {{{
#output は./ これをつけてはいけない.
output_base = "{{_input_:output_file_basename}}"
output_tex = sprintf("%s.tex",output_base)
output_eps = sprintf("%s.eps",output_base)

set terminal epslatex color
set output output_tex

replot

pause sleep_time

unset output

system sprintf("epslatex2pdf.sh %s %s",output_tex,graph_size)
system sprintf("rm %s %s",output_tex,output_eps)
#}}}

# vim:fenc=utf-8 ff=unix ft=gnuplot foldmethod=marker :
