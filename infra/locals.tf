resource "random_string" "random" {
  length           = 4
  special          = false
}

locals {
  acr_name = "devopsautomationid${random_string.random.result}"
}