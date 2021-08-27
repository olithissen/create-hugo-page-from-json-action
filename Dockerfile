FROM alpine:latest

RUN apk update && apk upgrade && apk add jq

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]