FROM       golang:1.7.4-alpine
MAINTAINER drillbits <neji@drillbits.jp>

WORKDIR /tmp/workdir

COPY main.go ./
RUN go build -o app main.go

EXPOSE 80

CMD ["./app", "-p", "80"]
