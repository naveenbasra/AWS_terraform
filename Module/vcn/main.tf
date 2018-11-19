resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames="true"
	tags{
	Name = "${var.vpc_name}"
        }
}


resource "aws_vpc_dhcp_options" "lcm_dhcp_association" {
  domain_name          = "test.service.com"
  domain_name_servers  =  ["AmazonProvidedDNS"]
  tags {
    Name = "${var.vpc_name}_DHCP_OPTION}"
  }
}

resource "aws_vpc_dhcp_options_association" "lcm_dns_resolver" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.lcm_dhcp_association.id}"
}


output "aws_vpc_id" {
   value = "${aws_vpc.vpc.id}"
}
