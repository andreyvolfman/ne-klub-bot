FROM golang:1.16.5-alpine

WORKDIR $GOPATH/src/ne-klub-bot

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o $GOPATH/bin/ne-klub-bot/main .

FROM scratch

COPY --from=0 /go/bin/ne-klub-bot/main .

CMD ["./main"]
