set -e
clang++ -O2 src/images.cpp -o drawimages
./drawimages

for f in ./images/*.ppm; do
  echo "Processing $f file...";
  filename=$(basename -- "$f")
  #convert $f -resize 320x200\! -depth 8 -colors 16 -type palette -remap ./images/palette.png ./images/${filename%.*}.png
  convert $f -depth 8 -colors 16 -type palette -remap $f ./images/${filename%.*}.png
  rm "$f"
done


#rm images/*.ppm

