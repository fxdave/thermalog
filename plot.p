set title "Data from CSV with Labels"
set xlabel "Time"
set ylabel "Temp [C]"
set y2label "MHz"
set y2tics

set xtics rotate

set terminal pngcairo size 10000,2000 enhanced font 'Helvetica,24'
set output "asd.png"

# line styles
set style line 1 lt 1 lc rgb '#A6CEE3' # light blue

set xdata time
# 2024-03-07 21:05:02.630825
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M:%S" # otherwise it will show only MM:SS
set datafile separator ','

set key noenhanced
set key autotitle columnheader
set key outside

#time,gpu,package,cpu0,cpu1,cpu2,cpu3,cpu4,cpu5,cpu_freq,gpu_freq0,gpu_freq1,gpu_freq2,gpu_freq3

xPos3 = '2024-03-07 21:11:00'
set arrow at xPos3, graph 0 to xPos3, graph 1 nohead lc "red" dt 4
set label at xPos3, graph 1 "CS2 FHD" offset 0.5,0.7

xPos4 = '2024-03-07 21:41:00'
set arrow at xPos4, graph 0 to xPos4, graph 1 nohead lc "red" dt 4
set label at xPos4, graph 1 "CS2 FHD" offset 0.5,0.7

xPos6 = '2024-03-07 21:53:00'
set arrow at xPos6, graph 0 to xPos6, graph 1 nohead lc "red" dt 4
set label at xPos6, graph 1 "Stop" offset 0.5,0.7

xPos7 = '2024-03-08 00:12:00'
set arrow at xPos7, graph 0 to xPos7, graph 1 nohead lc "red" dt 4
set label at xPos7, graph 1 "CS2 FHD" offset 0.5,0.7

xPos8 = '2024-03-08 01:08:00'
set arrow at xPos8, graph 0 to xPos8, graph 1 nohead lc "red" dt 4
set label at xPos8, graph 1 "CS2 FHD" offset 0.5,0.7

xPos9 = '2024-03-08 01:30:00'
set arrow at xPos9, graph 0 to xPos9, graph 1 nohead lc "red" dt 4
set label at xPos9, graph 1 "CS2 2K" offset 0.5,0.7

xPos10 = '2024-03-08 01:42:00'
set arrow at xPos10, graph 0 to xPos10, graph 1 nohead lc "red" dt 4
set label at xPos10, graph 1 "Stop" offset 0.5,0.7



plot for [i=10:14] "temp.csv" using 1:i axis x1y2 title columnheader(i) with lines ls 1 lw 1 dt 2, \
for [i=2:9] "temp.csv" using 1:i axis x1y1 title columnheader(i) lw 1 with lines
