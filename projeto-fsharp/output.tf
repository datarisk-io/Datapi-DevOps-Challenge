output "service" {
  value = kubernetes_manifest.service.object
}

output "deployment" {
  value = kubernetes_manifest.deployment.object
}
