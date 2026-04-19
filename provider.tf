terraform {
  required_providers {
    solacebroker = {
      source  = "solaceproducts/solacebroker"
      version = "1.3.0"
    }
  }
}

provider "solacebroker" {
  username = var.username
  password = var.password
  url      = "https://mr-connection-5n01mprnw8h.messaging.solace.cloud:943"
}
