FROM alpine
MAINTAINER tziporkin@gmail.com

#Install python
RUN apk add python3
#Make workdir
RUN mkdir -p /home/work
RUN mkdir -p /home/public
WORKDIR /home/work
#Copy python file
COPY . .
#Run python file
CMD python3 pythonfile.py
