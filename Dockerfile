FROM node:8-jessie

# Define packages
ENV PACKAGES "jq git"

# Install Packages
RUN apt-get update \
    &&  apt-get install -y $PACKAGES


# Serverless Framework
RUN npm install -g serverless

ENTRYPOINT /bin/bash
