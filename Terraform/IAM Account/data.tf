# Create new secrets for these users (so they are not literally available in vault)
# GPG path user key
# This is referring to a location in hashicorp vault for example
data "vault_generic_secret" "pgp_key_data" {
  path = "<hashicorp>/${var.env}/<vault><location>"
}

