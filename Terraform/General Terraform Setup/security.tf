# aws_security_group
# aws_security_group_rule
# aws_key_pair
# aws_iam_role
# aws_iam_role_policy
# aws_kms_key
# aws_kms_alias

# To use your own safe aws_keypair, comment out the following resource:
## AWS keypair
#resource "aws_key_pair" "aws_keypair" {
#  key_name   = "enxs419-ec2kp001"
#  public_key = "${data.vault_generic_secret.419_public_key.data["public_key"]}"
#}

