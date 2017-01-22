#!/bin/bash

TO="Email To <mario.pisa@gmail.com>"
FROM="Email From <mario.pisa@gmail.com>"
SUBJECT="Hey SES"
MESSAGE="This work!"

date="$(date -R)"
priv_key="$AWS_SECRET_KEY"
access_key="$AWS_ACCESS_KEY"
signature="$(echo -n "$date" | openssl dgst -sha256 -hmac "$priv_key" -binary | base64 -w 0)"
auth_header="X-Amzn-Authorization: AWS3-HTTPS AWSAccessKeyId=$access_key, Algorithm=HmacSHA256, Signature=$signature"
endpoint="https://email.us-east-1.amazonaws.com/"
mime_version="MIME-Version: 1.0"

action="Action=SendEmail"
source="Source=$FROM"
to="Destination.ToAddresses.member.1=$TO"
subject="Message.Subject.Data=$SUBJECT"
xmllint --html --xpath "//body" barronsCOT.html 2>/dev/null >> barronsCOT2.html
message="Message.Body.Html.Data="$(cat barronsCOT2.html)
# message="Message.Body.Html.Data="'{"image" : "'"$(base64 barronsCOT2.html)"'"}'
curl -v -X POST -H "Date: $date" -H "$content_type" -H "$mime_version" -H "$auth_header" --data-urlencode "$message" --data-urlencode "$to" --data-urlencode "$source" --data-urlencode "$action" --data-urlencode "$subject" "$endpoint"
