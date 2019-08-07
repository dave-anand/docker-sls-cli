FROM node:alpine 

# Define packages
ENV PACKAGES "curl jq bash"

# Install Packages
RUN apk add --no-cache --update $PACKAGES

# Python for AWS CLI
RUN apk add --no-cache python3 \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && rm -r /root/.cache

# Install AWS CLI
RUN pip3 install awscli \
    && mkdir -p /root/.aws


# Serverless Framework
RUN npm install --production -g serverless \
    && npm install serverless-webpack-plugin webpack
