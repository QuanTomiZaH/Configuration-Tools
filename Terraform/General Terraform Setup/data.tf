#################################################################
# NOTE: DO NOT MAKE CHANGES TO THIS FILE AS IT MAY BE OVERRIDEN #
#################################################################

# In case you use a s3 backend to position the tfstate
terraform {
  backend "s3" {
    bucket         = "tfstate"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "tfstate-locking"
  }
}

# To use your own safe keypair for Azure or AWS, comment out this resource:
data "vault_generic_secret" "public_key" {
  path = "stacks/419-datatransferot/${var.env}/${var.context}/419_public_key"
}

# In case you want to use a specific AMI:
data "aws_ami" "windows2019-base" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}
