variable "kub_config" {
  description = "path kube config"
  default     = "~/.kube/config"
  type        = string
}

variable "name_space" {
  description = "name space"
  default     = "space-datarisk" 
  type        = string
}

variable "name_service" {
  description = "name service"
  default     = "api-datarisk" 
  type        = string
}

variable "image_docker" {
  description = "image docker"
  default     = "ghcr.io/lucasbahr/datapi-devops-challenge/datarisk:latest" 
  type        = string
}

variable "containe_port_http" {
  description = "container port http"
  default     = 8085
  type        = number
}


variable "external_port_http" {
  description = "external port http"
  default     = 8443
  type        = number
}

variable "name_secret_git" {
  description = "secret github vault"
  default     = "github-registry-secret"
  type        = string
}

variable "path_secret_vault" {
  description = "secret github vault"
  default     = "secret/datarisk/apikey"
  type        = string
}

variable "provedor_vault" {
  description = "servidor vault"
  default     = "http://127.0.0.1:8200"
  type        = string
}