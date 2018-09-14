module "network_policy"{
 source ="../policy"
 name   ="${var.env}_network_policy"
 description = "{var.env} Network Policy"
 policy_statement = <<EOF
	{
 	  "version": "2019-09-17"
	  "Statement": [
           {
	     "Action": "ec2:*",
	     "Effect": "Allow", 
             "resource": "*"
	   }
         }
EOF
}
              
