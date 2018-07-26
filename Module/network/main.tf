variable subnet_map_a {
type=list,
value=["10.1.0.1/16","10.3.0.1/16","10.5.0.1/16","10.7.0.1/16","10.7.0.1/16", "10.11.0.1/16"]
}
 
variable subnet_map_b {
value=["10.2.0.1/16","10.4.0.1/16","10.6.0.1/16","10.8.0.1/16","11.7.0.1/16","10.12.0.1/16"]
}

variable subnet_names{
value=["app_small", "app_medium","app_large","db","service", "lcm"]
}


resource "aws_vpc" "lcm" {
  cidr_block = "$var.cidr_block"
	tags{
	Name = "${var.env_id}_LCM_VPC}"
        }
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
  count= "${length(local.subnet_names)}"
  source="../subnet"
  subnet_name="${var.env_id}_${element(${var.subnet_names},count.index)}_a"
  subnet="${element(${var.subnet_map_a},count.index)}"
  vpc_id="${aws_vpc.lcm.id}"
}


module "subnet_b"{
  count= "${length(local.subnet_names)}"
  source="../subnet"
  subnet_name="${var.env_id}_${element(${var.subnet_names},count.index)}_b"
  subnet="${element(${var.subnet_map_b},count.index)}"
  vpc_id="${aws_vpc.lcm.id}"
}

