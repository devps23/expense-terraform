provider "vault-secrets" {
  address = "https://172.31.39.175:8200"
  token = var.token
  skip_tls_verify = true
}
