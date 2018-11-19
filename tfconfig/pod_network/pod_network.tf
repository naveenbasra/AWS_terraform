module "pod_network" {
source = "../../Module/pod_network"
env_id="${var.env_id}"
}

data "template_file" "instance_variables"  {
 template= "${file("instance_variables.tpl")}"
 vars{
   pod_network_vcn_id = "${module.pod_network.pod_network_vcn}" 
   pod_medium_app_subnet_id = "${module.pod_network.small_app_subnet_id}"
   pod_small_app_subnet_id="${module.pod_network.medium_app_subnet_id}"
 }
}

output "pod_network_variables" {
 value = "${data.template_file.instance_variables.rendered}"
}

