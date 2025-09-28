FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
 apt-get install -yq build-essential make libsqlite3-dev sqlite3

WORKDIR /app

COPY . .

RUN make

EXPOSE 16000

CMD ["./bin/facebooc"]
