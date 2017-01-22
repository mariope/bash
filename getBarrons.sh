#!/bin/bash

./getBarrons.R > getBarrons.log
# python -m premailer -f barronsCOT.html -o barronsCOT2.html
# xmllint --html --xpath "//body" barronsCOT.html 2>/dev/null >> barronsCOT2.html

# # send output by sendgrid mail
# SGTO='mario.pisa@gmail.com'
# SGTONAME='Mario'
# SGSUBJECT='Output from getBarrons.R '$(date)
# SGFROM=mariope.develop@gmail.com
# SGTEXT='hola'
# SGUSER=$SENDGRID_USERNAME
# SGPASS=$SENDGRID_PASSWORD
# curl -d "to=${SGTO}&toname=${SGTONAME}&subject=${SGSUBJECT}&html=${SGTEXT}&files=${'barronsCOT.html'}&from=${SGFROM}&api_user=${SGUSER}&api_key=${SGPASS}" https://api.sendgrid.com/api/mail.send.json
./AWS-SES.sh
