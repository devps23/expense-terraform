provider "vault-secrets" {
  address = "https://34.229.227.189:8200"
  token = var.token
  skip_tls_verify = true
}
