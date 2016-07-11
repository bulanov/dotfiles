#!/bin/sh

LOG="/home/bulanov/logs-archive/access_log"

cat "${LOG}" | \
cut -d '"' -f 6        | \
egrep -i '(bot*|crawl|spider|jeeves|alexa|rambler|yandex|yahoo|twiceler)'   | \
sort | uniq -c | sort -n | tail -n 30
