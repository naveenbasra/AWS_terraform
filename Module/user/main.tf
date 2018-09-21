resource "aws_iam_user" "user" {
  name = "${var.user_name}"
  path = "/"
}

resource "aws_iam_user_group_membership" "user_membership" {
  user = "${aws_iam_user.user.name}"

  groups = [
    "${aws_iam_group.group3.name}",
  ]
}

