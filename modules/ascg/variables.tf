variable "cluster_name" {
  type = string
}
variable "launch_conf_name" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "alb_tg_arns" {
  type = list(string)
}

variable "desired_capacity" {
  type = number
}
variable "min_size" {
  type = number
}
variable "max_size" {
  type = number
}