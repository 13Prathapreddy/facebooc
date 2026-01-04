# -------- Build stage --------
FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    make \
    libsqlite3-dev \
    sqlite3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN make

# -------- Runtime stage --------
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    libsqlite3-0 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/bin/facebooc /app/facebooc

RUN chmod +x /app/facebooc

EXPOSE 16000

CMD ["/app/facebooc"]

