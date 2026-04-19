
resource "solacebroker_msg_vpn_acl_profile" "msg_vpn_acl_profile1" {
  msg_vpn_name                        = var.msg_vpn_name
  acl_profile_name                    = "test"
  client_connect_default_action       = "allow"
  publish_topic_default_action        = "allow"
  subscribe_share_name_default_action = "disallow"
  subscribe_topic_default_action      = "allow"
}

resource "solacebroker_msg_vpn_acl_profile_client_connect_exception" "msg_vpn_acl_profile_client_connect_exception1" {
  msg_vpn_name                     = var.msg_vpn_name
  acl_profile_name                 = solacebroker_msg_vpn_acl_profile.msg_vpn_acl_profile1.acl_profile_name
  client_connect_exception_address = "192.168.1.1/24"
}

resource "solacebroker_msg_vpn_acl_profile_publish_topic_exception" "msg_vpn_acl_profile_publish_topic_exception1" {
  msg_vpn_name                   = var.msg_vpn_name
  acl_profile_name               = solacebroker_msg_vpn_acl_profile.msg_vpn_acl_profile1.acl_profile_name
  publish_topic_exception        = "test1"
  publish_topic_exception_syntax = "smf"
}

resource "solacebroker_msg_vpn_acl_profile_subscribe_share_name_exception" "msg_vpn_acl_profile_subscribe_share_name_exception1" {
  msg_vpn_name                          = var.msg_vpn_name
  acl_profile_name                      = solacebroker_msg_vpn_acl_profile.msg_vpn_acl_profile1.acl_profile_name
  subscribe_share_name_exception        = "test3"
  subscribe_share_name_exception_syntax = "mqtt"
}

resource "solacebroker_msg_vpn_acl_profile_subscribe_topic_exception" "msg_vpn_acl_profile_subscribe_topic_exception1" {
  msg_vpn_name                     = var.msg_vpn_name
  acl_profile_name                 = solacebroker_msg_vpn_acl_profile.msg_vpn_acl_profile1.acl_profile_name
  subscribe_topic_exception        = "test4"
  subscribe_topic_exception_syntax = "smf"
}