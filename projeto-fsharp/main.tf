provider "kubernetes" {
  config_path = var.kub_config
}

provider "vault" {
  address = var.provedor_vault
}

data "vault_generic_secret" "api_key" {
  path = var.path_secret_vault
}


resource "kubernetes_namespace" "spc-dk" {
  metadata {
    name = var.name_space
  }
}

resource "kubernetes_manifest" "deployment" {
  manifest = yamldecode(templatefile(("./k8s/deployment.yaml"),{
    namespace    = var.name_space
    servicename  = var.name_service
    containerporthttp = var.containe_port_http
    imagedocker = var.image_docker
    gitsecret = var.name_secret_git
  }))
}

resource "kubernetes_manifest" "service" {
  manifest = yamldecode(templatefile(("./k8s/service.yaml"),{
    namespace    = var.name_space
    servicename  = var.name_service
    containerporthttp = var.containe_port_http
    externalporthttp = var.external_port_http
  }))
}

resource "kubernetes_manifest" "auth" {
  manifest = yamldecode(templatefile(("./k8s/auth.yaml"),{
    gitsecret = var.name_secret_git
    namespace    = var.name_space
    path = tostring(data.vault_generic_secret.api_key.data["value"])
  }))

}
