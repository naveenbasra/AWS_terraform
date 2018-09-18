resource "aws_iam_policy" "policy"{
 name	= "${var.name}"
 path   = "/"
 description = "${var.description}"
 policy = "${var.policy_statement}"
}
