#!/bin/bash

rm *.html

# download web page and strip labels
# web=$(curl --request GET 'http://www.madrid.org/cs/Satellite?pagename=ComunidadMadrid/Comunes/Presentacion/popupGestionTelematica&language=es&c=CM_ConvocaPrestac_FA&cid=1354178312070&nombreVb=listas')
# titles=$(echo "$web" | grep -e '<li>' | sed -E 's/<[^>]*>//g')
# urls=$(echo "$web" | grep -e '<a href' | grep -o "'.*'")
# echo "$titles"
# echo "$urls"

# save the page
curl -o cam.html 'http://www.madrid.org/cs/Satellite?pagename=ComunidadMadrid/Comunes/Presentacion/popupGestionTelematica&language=es&c=CM_ConvocaPrestac_FA&cid=1354178312070&nombreVb=listas'
# captura todo lo que está dentro de la etiqueta especificada
xmllint --html --xpath "//ul" cam.html 2>/dev/null >> output.html

# busca un patron "/cs" y lo sustituye
sed 's/\/cs/www.madrid.org\/cs/g' output.html >> output2.html

# We can get the files that are modified after a particular time using -z option in curl.
# curl -z 21-Dec-11 http://www.example.com/yy.html


# send output by sendgrid mail
SGTO=name@gmail.com
SGTONAME='Mariope'
SGSUBJECT='Output from CAM '$(date)
SGFROM=mariope.develop@gmail.com
SGTEXT=$(date)'<p>'$(cat output2.html | grep  -e '<li>')'<p><a href="https://goo.gl/ySiqDf">Ir a la web de la CAM</a>'
SGUSER=$SENDGRID_USERNAME
SGPASS=$SENDGRID_PASSWORD
curl -d "to=${SGTO}&toname=${SGTONAME}&subject=${SGSUBJECT}&html=${SGTEXT}&from=${SGFROM}&api_user=${SGUSER}&api_key=${SGPASS}" https://api.sendgrid.com/api/mail.send.json
