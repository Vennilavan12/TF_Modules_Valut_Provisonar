/*provider "vault" {
  address = "http://localhost:8200"
  token   = "hvs.JH3uDdjqTpO3Ow5wi16NUfKc"
}

data "vault_generic_secret" "aws" {
  path = "secret/aws"
}
locals {
  aws_access_key = data.vault_generic_secret.aws.data["access_key"]
  aws_secret_key = data.vault_generic_secret.aws.data["secret_key"]
}*/

# KV Engine Method
provider "vault" {
  address = "http://localhost:8200"

  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}
# KV Engine Kv secret version2 v2 method
/*data "vault_kv_secret_v2" "aws" {
  mount = "kv"
  name = "demo"
}
locals {
  aws_access_key = data.vault_kv_secret_v2.aws.data["access_key"]
  aws_secret_key = data.vault_kv_secret_v2.aws.data["secret_key"]
}*/
# Kv Engine generic secret Method
data "vault_generic_secret" "aws" {
  path = "kv/demo"
}

locals {
  aws_access_key = data.vault_generic_secret.aws.data["access_key"]
  aws_secret_key = data.vault_generic_secret.aws.data["secret_key"]
}

/*provider "vault" {
  address = "http://localhost:8200"
}

# Fetch dynamic AWS credentials from Vault
data "vault_generic_secret" "aws_creds" {
  path = "aws/creds/ec2-role"
}

provider "aws" {
  region     = "us-east-2"
  access_key = data.vault_generic_secret.aws_creds.data["access_key"]
  secret_key = data.vault_generic_secret.aws_creds.data["secret_key"]
}
*/