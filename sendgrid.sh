#!/bin/bash

echo $1

# send output by sendgrid mail
# SGTO=name@gmail.com
# SGTONAME='Mariope'
# SGSUBJECT='Output from CAM '$(date)
# SGFROM=mariope.develop@gmail.com
# SGTEXT=$(date)'<p>'$(cat output2.html | grep  -e '<li>')'<p><a href="https://goo.gl/ySiqDf">Ir a la web de la CAM</a>'
# SGUSER=$SENDGRID_USERNAME
# SGPASS=$SENDGRID_PASSWORD
# curl -d "to=${SGTO}&toname=${SGTONAME}&subject=${SGSUBJECT}&html=${SGTEXT}&from=${SGFROM}&api_user=${SGUSER}&api_key=${SGPASS}" https://api.sendgrid.com/api/mail.send.json
