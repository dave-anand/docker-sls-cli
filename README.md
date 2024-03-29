# AWS CLI Docker Container

This is a containerized Serverless Framework CLI based on `node:8-alpine`.

[![DockerHub Badge](http://dockeri.co/image/anand000/docker-sls-cli)](https://hub.docker.com/r/anand000/docker-sls-cli/)

## Example build

```
docker build -t anand000/docker-sls-cli .
```

## Example usage

> The example below (keys) assumes an existing AWS account.

**Ensure the following are set**

```
export AWS_ACCESS_KEY_ID="<aws_access_key_id>"
export AWS_SECRET_ACCESS_KEY="<aws_secret_access_key>"
export AWS_DEFAULT_REGION="<aws_default_region>"
```

**Run the container detatched**

```
docker run --name docker-sls-cli \
    --rm \
    --detach \
    --tty \
    --env "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
    --env "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
    --env "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
    anand000/docker-sls-cli
```

**Run a command**

> While this is obviously a very simple example, more complex usage, particularly in a CI/CD pipeline, is possible.

```
docker exec -it docker-sls-cli sls version
```

## References

[Serverless Framework Documentation](https://serverless.com/framework/docs/)

# License

Licensed under the Apache License, Version 2.0 (the "License").

This repository and its contents are licensed under the terms detailed in the [LICENSE file](./LICENSE).

