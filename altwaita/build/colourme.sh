PRICOLOR="#93a1a1"
SECCOLOR="#586e75"
TERCOLOR="#839496"

echo $PRICOLOR
echo $SECCOLOR

sed -e "s/pricolor/"$PRICOLOR"/g" -e "s/seccolor/"$SECCOLOR"/g" -e "s/tercolor/$TERCOLOR/g" folders.svg > ../src/fullcolor/folders.svg




