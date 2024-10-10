variable "nlb_name" {
  description = "Name of the Network Load Balancer"
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal or external"
  type        = bool
  default     = false
}