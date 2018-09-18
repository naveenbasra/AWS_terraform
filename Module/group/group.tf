resource "aws_iam_group" "groups" {
  name = "${var.group_name}"
  path = "/users/"
}

