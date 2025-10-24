# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

store "varset" "aws_auth" {
  category = "terraform"
  name     = "hc-justin-clayton-varset"
}

deployment "development" {
  inputs = {
    regions        = ["us-west-2"]
    role_arn       = store.varset.aws_auth.stable.tfc_aws_run_role_arn
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-west-2", "us-east-2"]
    role_arn       = store.varset.aws_auth.stable.TFC_AWS_RUN_ROLE_ARN
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

