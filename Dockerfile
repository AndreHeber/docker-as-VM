# Use Alpine as the base image
FROM alpine:3.20.2

# Install necessary packages & Go
RUN apk add --no-cache \
    alpine-base \
    logrotate \
    dcron \
    go \
    s6-overlay

# Set up the s6-overlay configuration
COPY etc /etc

# Set up Go environment
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# Copy the Go application
COPY main.go /app/main.go

# Build the Go application
RUN go build -o /usr/local/bin/myapp /app/main.go

# Set up syslog
#COPY syslog.conf /etc/syslog.conf
#RUN mkdir -p /var/log/syslog

# Set up logrotate
#COPY logrotate.conf /etc/logrotate.conf

# Set up watchdog
#COPY watchdog.conf /etc/watchdog.conf

# Copy your application
# COPY myapp /usr/local/bin/myapp

# Set up s6 service for your app
#COPY run /etc/services.d/myapp/run

ENV LOG_LEVEL=WARNING

# Use s6-overlay as the entrypoint
ENTRYPOINT ["/init"]
