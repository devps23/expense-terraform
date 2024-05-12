provider "vault" {
  address = "https://route_internal.pdevops72.online:8200"
  skip_tls_verify =true
  token="hvs.tyEMRhd9Ms8lvUUU1ML0kYtp"
}
//data "vault_generic_secret" "rundeck_auth" {
//  path = "expense/demo"
//}
//resource "local_file" "file" {
//  content  = data.vault_generic_secret.rundeck_auth.data_json
//  filename = "/tmp/cred"
//}
