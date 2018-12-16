#sizes from
#identify -format "%w %h %f\n" *.png | sort -n -k 1
# and -k 2

width=$(identify -format "%w %h %f\n" *.png | sort -n -k 1 | tail -n 1 | awk '{ print($1) }')
height=$(identify -format "%w %h %f\n" *.png | sort -n -k 2 | tail -n 1 | awk '{ print($2) }')

echo "$width" "$height"

for x in *.png; do
	convert -resize "$width"x"$height" -gravity center -extent "$width"x"$height" -rotate "-90" "$x" test_"$x"
done

ffmpeg -r 1 -i test_%000d.h5.png -c:v libx264 -vf "format=yuv420p"  -r 30 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" output.mp4

