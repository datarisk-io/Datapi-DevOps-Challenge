variable "kub_config" {
  description = "Caminho do kube config"
  default     = "~/.kube/config"
  type        = string
}

variable "name_space" {
  description = "Nome do namespace"
  default     = "space-datarisk"
  type        = string
}

variable "name_service" {
  description = "Nome do serviço"
  default     = "api-datarisk"
  type        = string
}

variable "image_docker" {
  description = "Imagem do Docker"
  default     = "ghcr.io/lucasbahr/datapi-devops-challenge/datarisk:latest"
  type        = string
}

variable "containe_port_http" {
  description = "Porta do container HTTP"
  default     = 8085
  type        = number
}

variable "external_port_http" {
  description = "Porta externa HTTP"
  default     = 8443
  type        = number
}

variable "name_secret_git" {
  description = "Segredo do GitHub no Vault"
  default     = "github-registry-secret"
  type        = string
}

variable "path_secret_vault" {
  description = "Caminho do segredo no Vault"
  default     = "secret/datarisk/apikey"
  type        = string
}

variable "provedor_vault" {
  description = "Endereço do servidor Vault"
  default     = "http://127.0.0.1:8200"
  type        = string
}
