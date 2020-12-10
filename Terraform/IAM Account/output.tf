####################
## S3 Access Keys ##
####################

#Only use this if you want ouput from terraform itself

# OT User Access Keys
output "user-access-key" {
  value       = "${aws_iam_access_key.test-user-access-key.id}"
  description = "the access key belonging to the test-user-access-key"
}

output "user-secret-key" {
  value       = "${aws_iam_access_key.test-user-access-key.encrypted_secret}"
  description = "the secret key belonging to the test-user-access-key"
}


