Random_Getal=$((1 + RANDOM % 10)) 

Aantalgokken=1 

echo 'Probeer het willekeurig getal te raden!'


while [ $Aantalgokken -le 3 ]; do
    echo 'poging nummer #'$Aantalgokken
    
    read -p "wat is je gok? [n]: " gok

    
    while [[ ! $gok =~ (^[1-9]$|^10$)  ]]; do
        read -p 'geen goede input. jouw gok? [n]: ' gok
    done

    
    if [ $gok -eq $Random_Getal ]; then
        echo 'Correct! het nummer was:' $Random_Getal
        break;
    else
         
        if [ $gok -lt $Random_Getal ]; then 
            echo 'Hoger';
        elif [ $gok -gt $Random_Getal ]; then
            echo 'Lager';
        fi
    fi
    
    
    ((Aantalgokken+=1))
done

if [ $gok -ne $Random_Getal ]; then
    echo 'Helaas! Je hebt geen pogingen meer!'
    echo 'Het random getal was: ' $Random_Getal
fi