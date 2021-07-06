FROM golang:1.16.5-alpine

WORKDIR /go/src/github.com/andreyvolfman/ne-klub-bot

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/github.com/andreyvolfman/ne-klub-bot/main .

FROM scratch

COPY --from=0 /go/bin/github.com/andreyvolfman/ne-klub-bot/main .
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

CMD ["./main"]
