#!/bin/sh -l

cat articles.json \
| jq '.list[] | {"title": .resolved_title, "url": .resolved_url, "excerpt": .excerpt,  "tags": [.tags[]?.tag], date: .time_updated | tonumber | strftime("%Y-%m-%d") } ' \
| jq -s \
| jq '.[] | select(.tags[] | contains("publish"))' \
| jq -s \
| jq '.[] | del(.tags[] | select(. == "publish"))' \
| jq -s > filtered.json