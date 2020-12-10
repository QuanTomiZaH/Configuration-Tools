#Example of a variable that is pre-defined as a global variable(for example that one gets loaded in beforehand)
variable "aws-region" {}
variable "context" {}
variable "aws-sregion" {}
variable "cust" {}
variable "aws-az1" {}
variable "aws-az2" {}
variable "aws-az3" {}

# Hand made variable specific for this configuration / stack / env
variable "aws-services-key-pair" {
  default = "enxsew1-kp001"
}
variable "stack-env" {
  type    = "string"
  default = "s"
}

variable "stack-name" {
  type    = "string"
  default = "name"
}

variable "stack-number" {
  type    = "string"
  default = "number"
}

variable "app-number" {
  type    = "string"
  default = "number"
}

# Permission boundary role
variable "permissions_boundary" {
  default = "permission-boundary"
}
