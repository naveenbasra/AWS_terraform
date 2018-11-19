module "lcm_network" {
source = "../../Module/lcm_network"
env_id="${var.env_id}"
}

data "template_file" "instance_variables"  {
 template= "${file("instance_variables.tpl")}"
 vars{
   lcm_network_vcn_id = "${module.lcm_network.lcm_network_vcn}" 
   lcm_app_subnet_id = "${module.lcm_network.app_subnet_id}"
   lcm_monitor_subnet_id="${module.lcm_network.lcm_monitor_subnet_id}"
   lcm_svc_app_id="${module.lcm_network.lcm_svc_app_subnet_id}"
   lcm_bastion_subnet_id="${module.lcm_network.lcm_bastion_subnet_id}"
 }
}

resource "aws_internet_gateway" "lcm_network_gw" {
  vpc_id = "${module.lcm_network.lcm_network_vcn}"

  tags {
    Name = "lcm_network_gw"
  }
}

resource "aws_route_table" "lcm_network_vpc_route_table" {
  vpc_id = "${module.lcm_network.lcm_network_vcn}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.lcm_network_gw.id}"
  }

  tags {
    Name = "${var.env_id}_lcm_network_vpc_route_table"
  }
}



resource "aws_main_route_table_association" "a" {
  vpc_id         = "${module.lcm_network.lcm_network_vcn}"
  route_table_id = "${aws_route_table.lcm_network_vpc_route_table.id}"
}


output "lcm_network_variables" {
 value = "${data.template_file.instance_variables.rendered}"
}


