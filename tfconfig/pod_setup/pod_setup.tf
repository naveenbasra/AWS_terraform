data "aws_canonical_user_id" "current" {}

module "lcm_network" {
  source = "../../Module/vcn_peering"
  source_vpc_id="${var.pod_vpc_id}"
  target_vpc_id="${var.lcm_vpc_id}"
}



resource "aws_security_group" "pod_family" {
  name        = "${var.env_id}_pod_family"
  description = "Security group for ${var.env_id}_pod_family"
  vpc_id      = "${var.pod_vpc_id}"
}

  
resource "aws_security_group" "bastion_family" {
   name        = "${var.env_id}_bastion_family"
   description = "Security group for ${var.env_id}_bastion_family"
   vpc_id      = "${var.lcm_vpc_id}"
}

resource "aws_security_group_rule" "pod_family_ingress" {
	  type            = "ingress"
	  from_port       = 22
	  to_port         = 22
	  protocol        = "tcp"
	  cidr_blocks     = ["${var.lcm_bastion_subnet_cidr}"]
	  security_group_id = "${aws_security_group.pod_family.id}"
}

resource "aws_security_group_rule" "bastion_family_ingress" {
	  type            = "ingress"
	  from_port       = 22
	  to_port         = 22
	  protocol        = "tcp"
	  cidr_blocks     = ["192.168.0.0/16"]
	  security_group_id = "${aws_security_group.bastion_family.id}"
}
