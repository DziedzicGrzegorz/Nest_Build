FROM ubuntu:latest
LABEL authors="grzeg"

ENTRYPOINT ["top", "-b"]