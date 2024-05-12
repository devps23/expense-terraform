data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "RHEL-9-DevOps-Practice"
  owners           = [973714476881]
}
provider "vault" {
  address = "https://54.174.135.244:8200"
  skip_tls_verify =true
  token="hvs.tyEMRhd9Ms8lvUUU1ML0kYtp"
}
data "vault_generic_secret" "rundeck_auth" {
  path = "expense_cred/ssh"
}
