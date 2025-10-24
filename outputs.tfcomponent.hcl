# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "urls" {
  type        = list(list(string))
  description = "URL endpoints for the API Gateways"
  value       = [for x in component.api_gateway : tolist("${x.hello_url}/hello?name=human")]
}
