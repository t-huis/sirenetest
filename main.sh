#!/bin/bash

webhook="$( cat "$HOME/.sirenetest/webhook.url")"

content="https://cdn.discordapp.com/attachments/443394113904181248/1016287116440911902/unknown.png"

# give us a few seconds in case cron fires us up too early
sleep 2;

# terminate if not 12:00 on the first monday of the month
[ "$(date "+%H:%M")" != "12:00" ] || exit
[ "$(date "+%m")" -le "7" ] || exit
[ "$(date "+%w")" -ne "1" ] || exit

curl -Ss -H "Content-Type: application/json" \
         -d "{\"username\":\"HOOOOOEEEEEUUUUUUUUUU\", \"avatar_url\":\"$content\", \"content\":\"$content\"}" "$webhook"
