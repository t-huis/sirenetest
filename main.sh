#!/bin/bash

webhook="$( cat "$HOME/.sirenetest/webhook.url")"

content="https://cdn.discordapp.com/attachments/443394113904181248/1016287116440911902/unknown.png"

# give us a few seconds in case cron fires us up too early
sleep 2;

# terminate if not 12:00 on the first monday of the month
[ "$(date "+%H:%M")" != "12:00" ] || exit
[ "$(date "+%m")" -le "7" ] || exit
[ "$(date "+%w")" -ne "1" ] || exit

# terminate if we're on a national holiday
[ "$(date "+%m%d")" = "0101" ] && exit # nieuwjaarsdag
[ "$(date "+%m%d")" = "0427" ] && exit # koningsdag
[ "$(date "+%m%d")" = "0505" ] && exit # bevrijdingsdag
[ "$(date "+%m%d")" = "1225" ] && exit # 1e kerstdag
[ "$(date "+%m%d")" = "1226" ] && exit # 2e kerstdag

# Goede Vrijdag, Pasen, Hemelvaartsdag en Pinksteren kunnen nooit op een maandag vallen
# En kunnen dus niet op de 1e maandag van de maand vallen. :)

curl -Ss -H "Content-Type: application/json" \
         -d "{\"username\":\"HOOOOOEEEEEUUUUUUUUUU\", \"avatar_url\":\"$content\", \"content\":\"$content\"}" "$webhook"
