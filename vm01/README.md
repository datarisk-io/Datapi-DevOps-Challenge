## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.80.0 |

## Providers

| Name | Version | Description |
|------|---------|-------------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.80.0 | Instância do provedor Azure para interação com os recursos na nuvem

## Resources

| Name | Version | Description |
|------|---------|-------------|
| [azurerm_linux_virtual_machine.vm01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/linux_virtual_machine) | resource | Máquina virtual criada no ambiente do Azure |
| [azurerm_network_interface.vnic01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/network_interface) | resource | Interface de rede virtual para conexão da VM com a rede do Azure |
| [azurerm_network_security_group.nsg01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/network_security_group) | resource | Grupo de segurança que gera as regras de rede da nossa máquina (exemplo: abertura de portas de entrada e saída) |
| [azurerm_public_ip.puip01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/public_ip) | resource | IP público para conexão externa |
| [azurerm_resource_group.dkgp](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/resource_group) | resource | Grupo de recursos do Azure para organização do ambiente e comunicação entre os recursos |
| [azurerm_subnet.sub01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/subnet) | resource | Subnet criada para configuração na vm01 |
| [azurerm_subnet_network_security_group_association.nsg01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/subnet_network_security_group_association) | resource | Associação da subnet ao grupo de segurança de rede |
| [azurerm_virtual_network.vnet01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/virtual_network) | resource | Configuração da rede virtual

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_ssh_key_path"></a> [admin\_ssh\_key\_path](#input\_admin\_ssh\_key\_path) | Caminho para a chave pública SSH do administrador | `string` | `".ssh/admin-vm01.pub"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Nome de usuário do administrador | `string` | `"datarisk-admin"` | no |
| <a name="input_image_offer"></a> [image\_offer](#input\_image\_offer) | A oferta da imagem | `string` | `"0001-com-ubuntu-server-focal"` | no |
| <a name="input_image_publisher"></a> [image\_publisher](#input\_image\_publisher) | O publicador da imagem | `string` | `"Canonical"` | no |
| <a name="input_image_sku"></a> [image\_sku](#input\_image\_sku) | O SKU da imagem | `string` | `"20_04-lts"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | A versão da imagem | `string` | `"latest"` | no |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | Nome da interface de rede (NIC) | `string` | `"nic-vm-linux01"` | no |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Nome do Grupo de Segurança de Rede (NSG) | `string` | `"nsg-01"` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | Tipo de conta de armazenamento para o disco do sistema operacional | `string` | `"Standard_LRS"` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Nome do IP público | `string` | `"ip-vm-linux01"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Localização do grupo de recursos | `string` | `"eastus2"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nome do grupo de recursos | `string` | `"datarisk"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Nome da subnet | `string` | `"sub-01"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Nome da máquina virtual | `string` | `"vm-linux01"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Tamanho da máquina virtual | `string` | `"Standard_B2ms"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual (VNet) | `string` | `"vnet-01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm01_id"></a> [vm01\_id](#output\_vm01\_id) | Id da Vm01 |
| <a name="output_vm01_name"></a> [vm01\_name](#output\_vm01\_name) | Maquina alocada |
| <a name="output_vm01_size"></a> [vm01\_size](#output\_vm01\_size) | Nome da VM |

## Comments


| Resource | Comment |
|------|-------------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) |  O provedor Azure foi utilizado para criar uma VM Linux com as configurações necessárias para a conexão. A pasta '.ssh' contém as chaves de autenticação no recurso, utilizando o usuário que esta  configurado nas variáveis |
|[Estrutura Terraform](./)| A estrutura dos arquivos Terraform dentro da pasta 'vm01' foi organizada por tipo de recurso. Essa abordagem foi adotada para proporcionar uma melhor organização e disponibilidade dos recursos |
[Build GitHub Actions](../.github/workflows/apply-resource-vm01.yml) | Dentro da pasta .github/workflows, encontra-se o arquivo YAML para a execução do build do Terraform, denominado 'apply-resource-vm01'. Esse build está configurado para ser iniciado em pull requests das branches 'develop' ou 'master'. No arquivo, há uma credencial do Azure que foi criada e adicionada aos secrets do GitHub. Caso seja utilizado em outro ambiente, é necessário adicionar essa configuração para que o build seja realizado com sucesso.