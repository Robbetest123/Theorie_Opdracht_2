Random_Getal=$((1 + RANDOM % 10)) # random getal aanmaken

Aantalgokken=1  # het aantal gokken in een variabele stoppen

echo 'Probeer het willekeurig getal te raden!'


while [ $Aantalgokken -le 3 ]; do 
    echo 'poging nummer #'$Aantalgokken
    
    read -p "wat is je gok? [n]: " gok # gok opvragen

    
    while [[ ! $gok =~ (^[1-9]$|^10$)  ]]; do # kijken of de gok voldoet aan de voorwaarden
        read -p 'geen goede input. jouw gok? [n]: ' gok
    done

    
    if [ $gok -eq $Random_Getal ]; then # indien de gok gelijk is aan het random getal
        echo 'Correct! het nummer was:' $Random_Getal 
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
fi