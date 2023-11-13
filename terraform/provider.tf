provider "kubernetes" {
  load_config_file       = false  
  config_path = "/etc/rancher/k3s/k3s.yaml"
   
}
