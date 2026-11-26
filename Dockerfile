FROM alpine:3.20
RUN apk add --no-cache wget unzip
RUN wget -q https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip -O /tmp/xray.zip && unzip -q /tmp/xray.zip -d /usr/local/bin/ && rm /tmp/xray.zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
