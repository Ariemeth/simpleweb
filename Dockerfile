ARG COMPILER_VERSION="1.14.10"

FROM golang:${COMPILER_VERSION} AS builder

WORKDIR /build

COPY . .

RUN  CGO_ENABLED=0 \
     go build \
       -a \
       -installsuffix cgo \
       -ldflags '-extldflags "-static"' 


FROM scratch AS release

LABEL author="Edward Carmack"

WORKDIR /srv

COPY --from=builder build/simpleweb .

EXPOSE 8081

ENTRYPOINT ["./simpleweb"]

FROM release
