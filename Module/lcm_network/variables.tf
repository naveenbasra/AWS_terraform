variable "cidr_block" {
default="10.0.0.0/16"}
variable "vpc_id" {
default=""
}

variable "env_id" {
}

variable subnet_map_a {
default=["10.0.1.0/24","10.0.3.0/24","10.0.5.0/24","10.0.7.0/24","10.0.9.0/24","10.0.11.0/24"]
}

variable subnet_map_b {
default=["10.0.2.0/24","10.0.4.0/24","10.0.6.0/24","10.0.8.0/24","10.0.10.0/24","10.0.12.0/24"]
}

variable subnet_names{
default=["app_small", "app_medium","app_large","db","service", "lcm"]
}

variable "subnet_az"{
default="us-east-2b"
}
variable "lcm_app_subnet_cidr" {
default="10.0.1.0/24"
}

variable "is_public" {
 default="false"
}
variable "lcm_subnet_name" {
 default="lcm_subnet"
}

variable "lcm_monitor_subnet"{
default="10.0.2.0/24"
}
variable "lcm_svc_app_subnet_cidr"{
default="10.0.3.0/24"
}
variable "lcm_bastian_subnet_cidr"{
default="10.0.4.0/24"
}
