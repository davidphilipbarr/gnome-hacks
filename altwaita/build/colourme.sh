PRICOLOR="#2aa198"
SECCOLOR="#168078"
TERCOLOR="#2aa198"
EDGE="#06665f"

echo $PRICOLOR
echo $SECCOLOR
echo $EDGE

sed -e "s/pricolor/"$PRICOLOR"/g" -e "s/seccolor/"$SECCOLOR"/g" -e "s/tercolor/$TERCOLOR/g" -e "s/EDGED/"$EDGE"/g" -e "s/EDGEL/"$SECCOLOR"/g" folders.svg > ../src/fullcolor/folders.svg




