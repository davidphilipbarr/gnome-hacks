BACKGROUND=$(dconf read /org/gnome/desktop/background/picture-uri)

BG=$(echo "$BACKGROUND" | sed "s/'//g" | sed "s/file:\/\///g")
echo "$BG"

convert -scale 10% -brightness-contrast -15x-15 -gaussian-blur 0x8 -resize 1000% "$BG" ~/.local/share/backgrounds/blurred_fast.jpg

SCREEN=$(xdpyinfo | awk '/dimensions/ {print $2}')
echo "$SCREEN"
WIDTH=$(echo "$SCREEN" |cut -d "x" -f 1)
echo "$WIDTH"
AV=$(convert "$BG" -resize 1x1 -format "%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]" info:-)
echo "$AV"

convert -resize "$SCREEN"^ -gravity center -extent "$SCREEN" "$BG" ~/.local/share/backgrounds/blurred_test.jpg

convert -resize "$SCREEN" -crop "$WIDTH"x33+0+0  -brightness-contrast -4x-4 -gaussian-blur 0x330 ~/.local/share/backgrounds/blurred_test.jpg ~/.local/share/backgrounds/blurred_panel.jpg

rm ~/.local/share/backgrounds/blurred_test.jpg
