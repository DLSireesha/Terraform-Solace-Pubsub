variable "username" {
   type        = string
   description = "Username"
   default = "test1-admin"
}
variable "password" {
   type        = string
   description = "Password"
   default = "####"
}
variable "msg_vpn_name" {
   type        = string
   description = "Name of the message vpn"
   default = "test1"
}
variable "queue_name" {
  type        = string
  description = "Name of the Solace queue"
  default     = "PUBLISH.SUBSCRIBE"
}
variable "dmq" {
  type        = string
  description = "Name of the DMQ"
  default     = "PUBLISH.SUBSCRIBE.DMQ"
}
