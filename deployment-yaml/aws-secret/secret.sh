#!/bin/bash

kubectl apply -f - <<END
apiVersion: v1
kind: Secret
metadata:
  name: aws-secret
type: Opaque
data:
   AWS_SECRET_ACCESS_KEY: $(cat ~/.aws/credentials |grep aws_secret_access_key | cut -d = -f2 | base64)
   AWS_ACCESS_KEY_ID: $(cat ~/.aws/credentials |grep aws_access_key_id | cut -d = -f2 | base64)
END