resource "aws_iam_group" "groups" {
  name = "${var.name}_group"
  path = "/users/"
}

resource "aws_iam_user" "user" {
  name = "${var.name}_user"
  path = "/"
}

resource "aws_iam_user_group_membership" "user_membership" {
  user = "${aws_iam_user.user.name}"
  groups = [
    "${aws_iam_group.groups.name}",
  ]
}

resource "aws_iam_policy" "policy"{
 name   = "${var.name}_policy"
 path   = "/"
 description = "${var.description}"
 policy = "${var.policy_statement}"
}

resource "aws_iam_group_policy_attachment" "policy-attach" {
  depends_on = ["aws_iam_group.groups"]
  group      = "${aws_iam_group.groups.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
