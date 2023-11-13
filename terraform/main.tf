data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "Ubuntu"
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  security_groups = ["acesso_geral"]
  user_data       = file("terraformando.sh")  
  tags = {
    Name          = "${var.environment}: App"
    Env           = var.environment
    Type          = var.instance_type
  }
}

resource "kubernetes_deployment" "projeto-fsharp" {
    depends_on = [
    aws_instance.web
  ]
  
  metadata {
    name = "projeto-fsharp"
    namespace = "default"
    labels = {
      app = "projeto-fsharp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "projeto-fsharp"
      }
    }

    template {
      metadata {
        labels = {
          app = "projeto-fsharp"
        }
      }

      spec {
        container {
          image = "ghcr.io/richardneves/datapi-devops-challenge/datapi-devops-challenge:latest"
          name  = "projeto-fsharp"
          port {
            container_port = 8085
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "projeto-fsharp" {
    depends_on = [
    aws_instance.web
  ]
  metadata {
    name = "projeto-fsharp"
  }

  spec {
    selector = {
      app = "projeto-fsharp"
    }

    port {
      protocol = "TCP"
      port     = 8085
      target_port = 8085
    }
  }
}

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