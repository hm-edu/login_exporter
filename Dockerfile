FROM golang:1.22.2 
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o exporter .
FROM chromedp/headless-shell
COPY --from=0 /app/exporter /app/exporter
ENTRYPOINT ["/app/exporter"]