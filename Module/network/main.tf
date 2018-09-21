
locals
{
 subnet_map_a={
   small="10.1.0.1/16"
   medium="10.3.0.1/16"
   large="10.5.0.1/16"
   db="10.7.0.1/16"
   service="10.7.0.1/16"
   lcm="10.11.0.1/16"
 }
 subnet_map_b={
   small="10.2.0.1/16"
   medium="10.4.0.1/16"
   large="10.6.0.1/16"
   db="10.8.0.1/16"
   service="11.7.0.1/16"
   lcm="10.12.0.1/16"
 }
 subnet_names={
   small="app_small"
   medium="app_medium"
   large="app_large"
   db="db"
   service="service"
   lcm="lcm"
 }

}


resource "aws_vpc" "lcm" {
  cidr_block = "$var.cidr_block"
	tags{
	Name = "${var.env_id}_LCM_VPC}"
}


resource "aws_vpc_dhcp_options" "ssm_dhcp_association" {
  domain_name          = "test.service.com"
  domain_name_servers  =  "AmazonProvidedDNS"
  tags {
    Name = "${var.env_id}_LCM_DHCP_OPTION}"
  }
}

resource "aws_vpc_dhcp_options_association" "ssm_dns_resolver" {
  vpc_id          = "${aws_vpc.lcm.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.ssm_dhcp_association.id}"
}


module "subnet_a"{
  count= "${length(local.subnet_names)"
  source="../subnet"
  subnet_name="${var.env_id}_${element(local.subnet.names,count.index)}_a"
  subnet="${element(local.subnet.map_a,count.index)}"
  vpc_id="{aws_vpc.lcm.id}
}


module "subnet_b"{
  count= "${length(local.subnet_names)"
  source="../subnet"
  subnet_name="${var.env_id}_${element(local.subnet.names,count.index)}_b"
  subnet="${element(local.subnet.map_b,count.index)}"
  vpc_id="{aws_vpc.lcm.id}
}

