

# Create a message queue on the event broker
resource "solacebroker_msg_vpn_queue" "queue1" {
    msg_vpn_name = var.msg_vpn_name
    queue_name      = var.queue_name
    ingress_enabled = true
    egress_enabled  = true 
	dead_msg_queue = var.dmq
}

# Create a message dmq on the event broker
resource "solacebroker_msg_vpn_queue" "dmq1" {
    msg_vpn_name = var.msg_vpn_name
	queue_name = var.dmq
}
resource "solacebroker_msg_vpn_queue_subscription" "sub1" {
  msg_vpn_name       = var.msg_vpn_name
  queue_name         = solacebroker_msg_vpn_queue.queue1.queue_name
  subscription_topic = "queue/2020/updated/v1/>"
}
resource "solacebroker_msg_vpn_queue" "queue2" {
  msg_vpn_name = var.msg_vpn_name
  queue_name      = "yellow"
  ingress_enabled = true
  egress_enabled  = true
  max_msg_size    = 54321
}

