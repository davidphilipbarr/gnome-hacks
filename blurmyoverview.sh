
BACKGROUND=$(dconf read /org/gnome/desktop/background/picture-uri)

#echo  | sed "s/\'//g" 
BG=$(echo $BACKGROUND | sed "s/'//g" | sed "s/file:\/\///g")
echo $BG

convert -scale 10% -brightness-contrast -20x-20 -blur 0x3.1 -resize 1000% $BG ~/.local/share/backgrounds/blurred_fast.jpg

