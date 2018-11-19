variable "cidr_block" {
default="10.1.0.0/16"}
variable "vpc_id" {
default=""
}

variable "env_id" {
}

variable "subnet_az"{
default="us-east-2b"
}
variable "pod_small_app_subnet_cidr" {
default="10.1.1.0/18"
}

variable "pod_medium_app_subnet_cidr" {
default="10.1.64.0/18"
}

variable "is_public" {
 default="false"
}
variable "pod_subnet_name" {
 default="pod_subnet"
}

