## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.auth](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.spc-dk](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [vault_generic_secret.api_key](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_containe_port_http"></a> [containe\_port\_http](#input\_containe\_port\_http) | container port http | `number` | `8085` | no |
| <a name="input_external_port_http"></a> [external\_port\_http](#input\_external\_port\_http) | external port http | `number` | `8443` | no |
| <a name="input_image_docker"></a> [image\_docker](#input\_image\_docker) | image docker | `string` | `"ghcr.io/lucasbahr/datapi-devops-challenge/datarisk:latest"` | no |
| <a name="input_kub_config"></a> [kub\_config](#input\_kub\_config) | path kube config | `string` | `"~/.kube/config"` | no |
| <a name="input_name_secret_git"></a> [name\_secret\_git](#input\_name\_secret\_git) | secret github vault | `string` | `"github-registry-secret"` | no |
| <a name="input_name_service"></a> [name\_service](#input\_name\_service) | name service | `string` | `"api-datarisk"` | no |
| <a name="input_name_space"></a> [name\_space](#input\_name\_space) | name space | `string` | `"space-datarisk"` | no |
| <a name="input_path_secret_vault"></a> [path\_secret\_vault](#input\_path\_secret\_vault) | secret github vault | `string` | `"secret/datarisk/apikey"` | no |
| <a name="input_provedor_vault"></a> [provedor\_vault](#input\_provedor\_vault) | servidor vault | `string` | `"http://127.0.0.1:8200"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment"></a> [deployment](#output\_deployment) | n/a |
| <a name="output_service"></a> [service](#output\_service) | n/a |
