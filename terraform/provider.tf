provider "kubernetes" {
  config_path = "/etc/rancher/k3s/k3s.yaml"
  config_context_cluster = "default" 
}