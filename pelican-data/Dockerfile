FROM ubuntu:16.04

MAINTAINER FrediApriliant <gygaman2@gmail.com>

#update OS
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get update
RUN apt-get -y upgrade 

#Install apps pendukung
RUN apt-get install make python-setuptools -y
RUN apt-get install python-pip -y
RUN pip install pelican Markdown 
RUN pip install --upgrade pelican Markdown 

#Setting work direktori
WORKDIR /responsitccl

#Expose default port pelican
EXPOSE 8000

