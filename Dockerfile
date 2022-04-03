FROM golang:1.18 AS builder
WORKDIR /go/src/golang-docker-ci
COPY app.go ./
RUN go mod init app && go build .

FROM scratch
WORKDIR /root/
COPY --from=builder /go/src/golang-docker-ci/app ./
CMD ["./app"]