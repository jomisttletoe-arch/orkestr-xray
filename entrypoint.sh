#!/bin/sh
UUID=${UUID}
PORT=${PORT:-3000}
WSPATH=${WSPATH:-/proxy}
cat > /etc/xray.json <<JSON
{
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "vless",
      "settings": {
        "clients": [{ "id": "$UUID" }],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": { "path": "$WSPATH" }
      }
    }
  ],
  "outbounds": [{ "protocol": "freedom" }]
}
JSON
exec /usr/local/bin/xray -config /etc/xray.json
