resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = "${var.source_vpc_id}"
  vpc_id        = "${var.target_vpc_id}"
  auto_accept   = "true"
}
