FROM node:alpine 

# Python for AWS CLI
RUN apk add --no-cache python3 \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && rm -r /root/.cache

# Packages and AWS CLI
RUN apk add --no-cache --update $PACKAGES \
    && pip3 install awscli \
    && mkdir -p /root/.aws


# Serverless Framework
RUN npm install --production -g serverless \
    && npm install serverless-webpack-plugin webpack
