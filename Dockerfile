FROM alpine:latest

RUN mkdir -p /opt/bingo /opt/bongo/logs/c1cf942518 && \
    chmod 777 /opt/bongo/logs/c1cf942518

COPY ./src/bingo /app/bingo
COPY ./src/config.yaml /opt/bingo/config.yaml

WORKDIR /app

RUN chmod +x /app/bingo && \
    adduser -D bingo

USER bingo

CMD ["./bingo", "run_server"]