FROM golang:alpine AS builder
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o main .

FROM alpine
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/main .
CMD ["./main"]