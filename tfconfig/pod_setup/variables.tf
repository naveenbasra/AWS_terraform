#common variables

variable "env_id"{
 default="dev"
}
variable "region"{}
variable "access_key"{}
variable "secret_key"{}

#Variable specific for pod_setup

variable pod_vpc_id {}
variable lcm_vpc_id {}
variable subnet_az{
 default="us-east-2b"
}
variable lcm_bastion_subnet_cidr{
}
