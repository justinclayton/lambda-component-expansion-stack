# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    regions        = ["us-west-2"]
    role_arn       = "arn:aws:iam::744108226776:role/tfc-hashicorp-wwtfo-demo-platform-dev-hc-justin-clayton-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-2"]
    role_arn       = "arn:aws:iam::744108226776:role/tfc-hashicorp-wwtfo-demo-platform-prod-hc-justin-clayton-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

