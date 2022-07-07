BACKGROUND=$(dconf read /org/gnome/desktop/background/picture-uri)

BG=$(echo "$BACKGROUND" | sed "s/'//g" | sed "s/file:\/\///g")
echo "$BG"

convert -scale 10% -brightness-contrast -30x-20 -gaussian-blur 0x3.1 -resize 1000% "$BG" ~/.local/share/backgrounds/blurred_fast.jpg

SCREEN=$(xdpyinfo | awk '/dimensions/ {print $2}')
echo "$SCREEN"
WIDTH=$(echo "$SCREEN" |cut -d "x" -f 1)
echo "$WIDTH"

convert -resize "$SCREEN"^ -gravity center -extent "$SCREEN" "$BG" ~/.local/share/backgrounds/blurred_test.jpg

convert -resize "$SCREEN" -crop "$WIDTH"x30+0+0 -scale 10% -brightness-contrast -15x-15 -gaussian-blur 0x4 -resize 1000% ~/.local/share/backgrounds/blurred_test.jpg ~/.local/share/backgrounds/blurred_panel.jpg

rm ~/.local/share/backgrounds/blurred_test.jpg
