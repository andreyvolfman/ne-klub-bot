FROM golang:1.16

WORKDIR /go/src/github.com/andreyvolfman/ne-klub-bot

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o /go/bin/github.com/andreyvolfman/ne-klub-bot/main .

FROM scratch

COPY --from=0 /go/bin/github.com/andreyvolfman/ne-klub-bot/main .

CMD ["./main"]  
