
module  "pod_vcn" {
source ="../vcn"
cidr_block="10.1.0.0/16"
vpc_name="${var.env_id}_pod_vpc"
is_public=false
subnet_name="${var.env_id}_pod_network"
env_id="${var.env_id}"
subnet_az="us-east-2b"
}



module "pod_small_app_subnet" {
source="../subnet"
subnet_vpc_id="${module.pod_vcn.aws_vpc_id}"
subnet="${var.pod_small_app_subnet_cidr}"
is_public=false
subnet_name="${var.env_id}_pod_small_subnet"
subnet_az="${var.subnet_az}"
}


module "pod_medium_app_subnet"{
source="../subnet"
subnet_vpc_id="${module.pod_vcn.aws_vpc_id}"
subnet="${var.pod_medium_app_subnet_cidr}"
is_public=false
subnet_name="${var.env_id}_pod_medium_subnet"
subnet_az="${var.subnet_az}"
}


output "pod_network_vcn"
{
 value = "${module.pod_vcn.aws_vpc_id}"
}
output "small_app_subnet_id"
{
 value = "${module.pod_small_app_subnet.subnet_id}"
}

output "medium_app_subnet_id"
{
 value = "${module.pod_medium_app_subnet.subnet_id}"
}


