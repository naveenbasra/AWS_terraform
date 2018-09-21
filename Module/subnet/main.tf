resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet}"
  availability_zone="${var.subnet_az}"
  map_public_ip_on_launch="false"
  tags {
    Name = "${var.subnet_name}"
  }
}

