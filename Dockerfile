FROM golang:1.16.2-alpine as build

WORKDIR /go/src/app

COPY . .

RUN go build -o main app/bookstore_Dataserve.go

FROM alpine
WORKDIR /app
COPY --from=build /go/src/app/ /app/

CMD ["/app/main"]