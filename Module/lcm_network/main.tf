
module  "lcm_vcn" {
source ="../vcn"
cidr_block="10.0.0.0/16"
vpc_name="${var.env_id}_lcm_vpc"
is_public=true
subnet_name="${var.env_id}_lcm_network"
env_id="${var.env_id}"
subnet_az="us-east-2b"
}



module "lcm_app_subnet" {
source="../subnet"
subnet_vpc_id="${module.lcm_vcn.aws_vpc_id}"
subnet="${var.lcm_app_subnet_cidr}"
is_public=false
subnet_name="${var.env_id}_lcm_subnet"
subnet_az="${var.subnet_az}"
}


module "lcm_monitor_subnet"{
source="../subnet"
subnet_vpc_id="${module.lcm_vcn.aws_vpc_id}"
subnet="${var.lcm_monitor_subnet}"
is_public=false
subnet_name="${var.env_id}_lcm_monitor_subnet"
subnet_az="${var.subnet_az}"
}

module "lcm_svc_app_subnet"{
source="../subnet"
subnet_vpc_id="${module.lcm_vcn.aws_vpc_id}"
subnet="${var.lcm_svc_app_subnet_cidr}"
is_public=false
subnet_name="${var.env_id}_lcm_svc_subnet"
subnet_az="${var.subnet_az}"
}

module "lcm_bastion_subnet" {
source="../subnet"
subnet_vpc_id="${module.lcm_vcn.aws_vpc_id}"
subnet="${var.lcm_bastian_subnet_cidr}"
is_public=true
subnet_name="${var.env_id}_lcm_bastion_subnet"
subnet_az="${var.subnet_az}"
}


output "lcm_network_vcn"
{
 value = "${module.lcm_vcn.aws_vpc_id}"
}
output "app_subnet_id"
{
 value = "${module.lcm_app_subnet.subnet_id}"
}

output "lcm_monitor_subnet_id"
{
 value = "${module.lcm_monitor_subnet.subnet_id}"
}

output "lcm_svc_app_subnet_id"
{
 value = "${module.lcm_svc_app_subnet.subnet_id}"
}

output "lcm_bastion_subnet_id"
{
 value = "${module.lcm_bastion_subnet.subnet_id}"
}

