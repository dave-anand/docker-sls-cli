FROM node:8-alpine

# Define packages
ENV PACKAGES "jq git bash"

# Install packages
RUN apk add --no-cache --update $PACKAGES

# Serverless Framework
RUN npm install -g serverless

ENTRYPOINT /bin/bash
