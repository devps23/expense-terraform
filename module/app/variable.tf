variable "instance_type" {}
variable "component" {}
variable "env" {}
variable "vpc_id" {}
variable "subnets" {}
variable "lb_type" {
  default = null
}
variable "psubnets" {
  default = null
}
variable "lb_need"{
  default = false
}
variable "app_port"{
  default = null
}
