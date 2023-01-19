variable "cluster_name" {
    type = string
}
variable "ami_id" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "key_name" {
    type = string
}

variable "sg_ids" {
    type = list(string)
}
variable "user_data" {
    type = string
}