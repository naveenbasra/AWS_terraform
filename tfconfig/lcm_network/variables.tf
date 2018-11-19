variable "env_id"{
 default="dev"
}
variable "region"{}
variable "access_key"{}
variable "secret_key"{}
variable "cidr_block"{
 default="10.0.0.0/16"
}
variable "is_public"{
 default="true"
}

variable subnet_name{
 default="lcm_network"
}
variable subnet_az{
 default="us-east-2b"
}

