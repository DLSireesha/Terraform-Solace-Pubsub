# Creating a queue in test service in solace pubsub+
# while initializing terraform init.. just keep only configuration file in the folder
# execute terraform in ubuntu then go to folder.
#if terraform not installed install with sudo snap install terraform

#Provider is a plugin which will install required(solace) provide to create and manage resources.
terraform {
  required_providers {
    solacebroker = {
      source  = "SolaceProducts/solacebroker"
      version = "1.3.0"
    }
  }
}

# Configure the provider
# Authentication the provider with user credentials
provider "solacebroker" {
  # Event broker management user credentials
  username = "test1-admin"
  password = "dk7ia7jp275ipojjnc3n2pn6ch"
  # The base URL of the Solace event broker,
  #  for example https://mybroker.example.org:<semp-service-port>
  url      = "https://mr-connection-5n01mprnw8h.messaging.solace.cloud:943"  #don't add /SEMP/v2/config at the end
}

# Create a message queue on the event broker
resource "solacebroker_msg_vpn_queue" "q" {
    msg_vpn_name = "test1"
    queue_name      = "GLOBAL.07332.2078.SERVICES"
    ingress_enabled = true
    egress_enabled  = true 
	dead_msg_queue = "GLOBAL.07332.2078.SERVICES.DMQ"
}

# Create a message dmq on the event broker
resource "solacebroker_msg_vpn_queue" "dmq" {
    msg_vpn_name = "test1"
	queue_name = solacebroker_msg_vpn_queue.q.dead_msg_queue
}

