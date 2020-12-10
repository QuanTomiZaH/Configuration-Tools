#####################
###### IAM User #####
#####################
#
##user creation
resource "aws_iam_user" "test-user" {
  name                 = "test-services-user"
  permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary}"
}

# User access key creation
resource "aws_iam_access_key" "test-user-access-key" {
  user    = "${aws_iam_user.test-user.name}"
  pgp_key = "${data.vault_generic_secret.pgp_key_data_ot.data["private_key"]}"
}

# Policy document for OT
data "aws_iam_policy_document" "bucket-access" {
  statement {
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.main.arn}",
      "${aws_s3_bucket.main.arn}/*",
    ]
  }
}

# Policy for OT
resource "aws_iam_policy" "bucket-pol" {
  name   = "<identifier>${var.stack-env}${var.stack-number}-${var.stack-name}-rw"
  policy = "${data.aws_iam_policy_document.bucket-access.json}"
}

# Policy uploader for OT
resource "aws_iam_user_policy_attachment" "s3-uploader" {
  user       = "${aws_iam_user.test-user.name}"
  policy_arn = "${aws_iam_policy.bucket-pol.arn}"
}
