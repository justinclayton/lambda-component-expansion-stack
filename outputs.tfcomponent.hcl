# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "urls" {
  type        = map(string)
  description = "URL endpoints for the API Gateways"
  value       = { for region, api_gw in component.api_gateway : region => "${api_gw.hello_url}/hello?name=human" }
}
