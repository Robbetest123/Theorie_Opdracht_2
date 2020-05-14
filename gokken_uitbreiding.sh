Random_Getal=$((1 + RANDOM % 10)) # random getal aanmaken

Aantalgokken=1  # het aantal gokken in een variabele stoppne

read -p "Hallo! Wat is jouw naam? " naam #naam van de speler opvragen

echo "Welkom $naam, probeer het juiste getal te raden!" # speler verwelkomen


while [ $Aantalgokken -le 3 ]; do 
    echo 'poging nummer #'$Aantalgokken
    
    read -p "wat is je gok? [n]: " gok # gok opvragen

    
    while [[ ! $gok =~ (^[1-9]$|^10$)  ]]; do # kijken of de gok voldoet aan de voorwaarden
        read -p 'geen goede input. jouw gok? [n]: ' gok
    done

    
    if [ $gok -eq $Random_Getal ]; then # indien de gok gelijk is aan het random getal
        echo 'Correct! het nummer was:' $Random_Getal 
        gewonnen=TRUE # indien we correct geraden hebben hebben we gewonnen!
        break;
    else # indien de gok niet gelijk is aan het random getal
         
        if [ $gok -lt $Random_Getal ]; then # indien de gok kleiner is dan het random getal
            echo 'Hoger';
        elif [ $gok -gt $Random_Getal ]; then # indien de gok groter is dan het random getal
            echo 'Lager';
        fi
    fi
    
    
    ((Aantalgokken+=1)) # het aantal gokken + 1 doen
done

if [ $gok -ne $Random_Getal ]; then # indien de laatste gok niet juist was..
    echo 'Helaas! Je hebt geen pogingen meer!'
    echo 'Het random getal was: ' $Random_Getal
    gewonnen=FALSE # we hebben verloren!
fi


if [ $Aantalgokken -eq 4 ]; then ((Aantalgokken-=1)); fi; # het aantal gokken staat nu op 4 => verlaag met 1


echo '**_____________________________________**' >> ./score.txt # lijn zetten in het bestand score.txt
echo "Naam: $naam" >> ./score.txt  # naam van de speler zetten in het bestand score.txt
echo "Datum: $(date)" >> ./score.txt # de datum weergeven in het bestand score.txt
echo "Gewonnen? $gewonnen" >> ./score.txt # weergeven of de speler gewonnen heeft of niet in het bestand score.txt
echo "aantal pogingen: $Aantalgokken" >> ./score.txt # het aantal poginen weergeven dat de speler gebruiktt heeft, dit zullen we weergeven in het bestand score.txt
echo ' ' >> ./score.txt # lege lijn plaatsen in het bestand score.txt