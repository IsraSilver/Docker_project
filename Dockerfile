FROM alpine
MAINTAINER tziporkin@gmail.com
#Install python
RUN apk add python3
#Make workdir
RUN mkdir -p /home/work
WORKDIR cd /home/work
#Copy python file
COPY . .
