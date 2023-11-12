data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "Ubuntu"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  security_groups = ["acesso_geral"]
  user_data       = file("terraformando.sh")  
  tags = {
    Name = "${var.environment}: App"
    Env  = var.environment
    Type = var.instance_type
  }
}

# provider "kubernetes" {
#   config_path = "~/.kube/config"
# }

# resource "kubernetes_deployment" "minha_aplicacao" {
#   metadata {
#     name = "minha-aplicacao"
#     labels = {
#       app = "minha-aplicacao"
#     }
#   }

#   spec {
#     replicas = 3

#     selector {
#       match_labels = {
#         app = "minha-aplicacao"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "minha-aplicacao"
#         }
#       }

#       spec {
#         container {
#           image = "SEU_REGISTRY/minha-aplicacao:latest"
#           name  = "minha-aplicacao"
#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "minha_aplicacao_service" {
#   metadata {
#     name = "minha-aplicacao-service"
#   }

#   spec {
#     selector = {
#       app = "minha-aplicacao"
#     }

#     port {
#       protocol = "TCP"
#       port     = 80
#       target_port = 80
#     }
#   }
# }

# resource "kubernetes_ingress" "minha_aplicacao_ingress" {
#   metadata {
#     name = "minha-aplicacao-ingress"
#   }

#   spec {
#     rule {
#       host = "meu-dominio.com"

#       http {
#         path {
#           path_type = "Prefix"
#           path      = "/"
#         }

#         backend {
#           service_name = kubernetes_service.minha_aplicacao_service.metadata[0].name
#           service_port = kubernetes_service.minha_aplicacao_service.spec[0].port[0].port
#         }
#       }
#     }
#   }
# }