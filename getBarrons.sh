#!/bin/bash

./getBarrons.R > getBarrons.log

# send output by sendgrid mail
SGTO='mario.pisa@gmail.com'
SGTONAME='Mario'
SGSUBJECT='Output from getBarrons.R '$(date)
SGFROM=mariope.develop@gmail.com
SGTEXT=$(date)'<p>'$(cat getBarrons.log)
SGUSER=$SENDGRID_USERNAME
SGPASS=$SENDGRID_PASSWORD
curl -d "to=${SGTO}&toname=${SGTONAME}&subject=${SGSUBJECT}&text=${SGTEXT}&from=${SGFROM}&api_user=${SGUSER}&api_key=${SGPASS}" https://api.sendgrid.com/api/mail.send.json
