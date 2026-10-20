#!/usr/bin/env bash
url=$(grep -E '^status_webhook:' deploy.yaml | awk '{print $2}')
echo "Configured status_webhook: $url"
curl -sS -o /dev/null -w "HTTP %{http_code}\n" --max-time 10 "$url" || echo "unreachable"
