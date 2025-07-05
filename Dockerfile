FROM alpine:3.18

RUN apk add --no-cache curl unzip

ENV PB_VERSION=0.21.4

WORKDIR /app

RUN curl -fsSL https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip -o pb.zip && \
    unzip pb.zip && \
    rm pb.zip

COPY pb_data /app/pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
