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

| Name | Version | Description |
|------|---------|-------------|
| [kubernetes_manifest.auth](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource | Utilização do manifesto kubernetes que gera autenticação do github no kubernetes
| [kubernetes_manifest.deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource | Utilização do manifesto kubernetes que faz o deploy do pod utilizando as especificações informadas e a imagem buildada no container registry do GITHUB
| [kubernetes_manifest.service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource | Configuração da exposição do app fsharp para utilização da api
| [kubernetes_namespace.spc-dk](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource | Criação de um novo espaço no kubernetes para subir a aplicação e os recursos
| [vault_generic_secret.api_key](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source | Captura da chave github atravez do vault para não expor ela no codigo

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_containe_port_http"></a> [containe\_port\_http](#input\_containe\_port\_http) | Porta do container HTTP | `number` | `8085` | no |
| <a name="input_external_port_http"></a> [external\_port\_http](#input\_external\_port\_http) | Porta externa HTTP | `number` | `8443` | no |
| <a name="input_image_docker"></a> [image\_docker](#input\_image\_docker) | Imagem do Docker | `string` | `"ghcr.io/lucasbahr/datapi-devops-challenge/datarisk:latest"` | no |
| <a name="input_kub_config"></a> [kub\_config](#input\_kub\_config) | Caminho do kube config | `string` | `"~/.kube/config"` | no |
| <a name="input_name_secret_git"></a> [name\_secret\_git](#input\_name\_secret\_git) | Segredo do GitHub no Vault | `string` | `"github-registry-secret"` | no |
| <a name="input_name_service"></a> [name\_service](#input\_name\_service) | Nome do serviço | `string` | `"api-datarisk"` | no |
| <a name="input_name_space"></a> [name\_space](#input\_name\_space) | Nome do namespace | `string` | `"space-datarisk"` | no |
| <a name="input_path_secret_vault"></a> [path\_secret\_vault](#input\_path\_secret\_vault) | Caminho do segredo no Vault | `string` | `"secret/datarisk/apikey"` | no |
| <a name="input_provedor_vault"></a> [provedor\_vault](#input\_provedor\_vault) | Endereço do servidor Vault | `string` | `"http://127.0.0.1:8200"` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment"></a> [deployment](#output\_deployment) | Informações do build |
| <a name="output_service"></a> [service](#output\_service) | Informações do serviço |

## Comments


| Resource | Comment |
|------|-------------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | Foi utilizado um servidor local para subir o Vault. Neste projeto, é necessário configurar um provedor local ou em nuvem para utilizar esse recurso. Este recurso está sendo utilizado para ocultar a chave do GitHub, que faz a autenticação no container registry, permitindo assim realizar o push e buildar o pod no Kubernetes. |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | Esse recurso está utilizando manifestos do Kubernetes criados para subir a aplicação na AKS do Azure. Faz-se necessário a configuração de um recurso próprio no Azure e a configuração da chave kubeconfig para autenticação, assim como alterações nas variáveis. |
[Build GitHub Actions](../.github/workflows/send-dockerfile-in-container-registry.yml) | Dentro da pasta .github/workflows, você encontrará o arquivo YAML denominado 'send-dockerfile-in-container-registry'. A função desse workflow é construir nossa imagem Docker no Container Registry do GitHub. Este workflow cria versões do container para melhor gerenciamento. Para um novo ambiente, é necessário cadastrar uma secret no GitHub para autenticação no Container Registry. Além disso, é possível alterar o nome da imagem, bastando modificar o valor de 'NAME_BUILD' na variável de ambiente