variable "instance_type" {}
variable "component" {}
variable "env" {}
variable "vpc_id" {}
variable "subnets" {}
variable "lb_type" {
  default = null
}
variable "lb_subnets" {
  default = null
}
variable "app_port"{
  default = null
}
variable "lb_required" {
  default = false
}
variable "lb_internet_facing"{
  default = null
}
variable "target_group"{
  default = null
}
