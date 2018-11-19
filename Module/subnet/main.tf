resource "aws_subnet" "subnet" {
  vpc_id     = "${var.subnet_vpc_id}"
  cidr_block = "${var.subnet}"
  availability_zone="${var.subnet_az}"
  map_public_ip_on_launch="${var.is_public}"
  tags {
    Name = "${var.subnet_name}"
  }
}
output "subnet_id"{
value = "${aws_subnet.subnet.id}"
}
