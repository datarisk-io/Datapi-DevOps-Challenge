output "service" {
  value       = kubernetes_manifest.service.object
  description = "Informações do serviço"
}

output "deployment" {
  value       = kubernetes_manifest.deployment.object
  description = "Informações do build"
}
