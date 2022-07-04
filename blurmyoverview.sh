
BACKGROUND=$(dconf read /org/gnome/desktop/background/picture-uri)

#echo  | sed "s/\'//g" 
BG=$(echo "$BACKGROUND" | sed "s/'//g" | sed "s/file:\/\///g")
echo "$BG"

convert -scale 10% -brightness-contrast -40x-20 -gaussian-blur 0x3.1 -resize 1000% "$BG" ~/.local/share/backgrounds/blurred_fast.jpg

SCREEN=$(xdpyinfo | awk '/dimensions/ {print $2}')
echo "$SCREEN"
WIDTH=$(echo "$SCREEN" |cut -d "x" -f 1)
echo "$WIDTH"

#convert -resize "$SCREEN" ~/.local/share/backgrounds/blurred_fast.jpg ~/.local/share/backgrounds/blurred_test.jpg

convert -resize "$SCREEN" -crop "$WIDTH"x30+0+0 -gaussian-blur 0x3.1  ~/.local/share/backgrounds/blurred_fast.jpg ~/.local/share/backgrounds/blurred_panel.jpg
