FROM golang:alpine as builder

COPY go.mod /

RUN go mod download -x

COPY provisioner.go /go/

RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o nfs-subdir-provisioner

FROM alpine

COPY --from=builder /go/nfs-subdir-provisioner /

RUN apk update --no-cache && apk add ca-certificates && chmod +x /nfs-subdir-provisioner

ENTRYPOINT ["/nfs-subdir-provisioner"]