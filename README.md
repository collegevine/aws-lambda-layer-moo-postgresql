# aws-lambda-layer-moo-postgresql

AWS Lambda layer that provides `moo-postgresql` for your runtime.

## Installation

```
sudo yum -y install git

git clone https://github.com/collegevine/aws-lambda-layer-moo-postgresql.git

cd aws-lambda-layer-moo-postgresql
./build.sh

# download layer ZIP, e.g. using `scp`
```

## Publish layer to your account

To be able to use the layer you must publish it to your account. You don't need
to provide a [compatible
runtime][lambda-runtimes], but
without it the layer won’t show up for selection n your lambda function. You can
still add it with the ARN though.

```sh
aws lambda publish-layer-version \
  --layer-name moo-postgresql \
  --compatible-runtimes python3.7 \
  --zip-file fileb://aws-lambda-layer-moo-postgresql.zip
```

[lambda-runtimes]: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
