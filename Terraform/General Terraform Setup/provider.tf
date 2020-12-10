# For aws
provider "aws" {
  # version = "~> 2.0"
  # region  = "${var.aws-region}"
  version = "2.51.0"

  region = "${var.aws-region}"
}

# For hashicorp vault
provider "vault" {
  version = "~> 2.0"
}

# For a custom provider called "template"
provider "template" {
  version = "~> 2.0"
}

