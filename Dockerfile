# Dockerfile to build Bowtie2 container images
# Based on Ubuntu

# Set the base image to Ubuntu
FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Douglas McCloskey <dmccloskey87@gmail.com>

# Update the repository sources list and install bowtie2
RUN apt-get update && apt-get install -y bowtie2

# Cleanup
RUN apt-get clean

# Create an app user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chmod -R u+rwx $HOME \
    && chown -R user:user $HOME

WORKDIR $HOME
USER user
