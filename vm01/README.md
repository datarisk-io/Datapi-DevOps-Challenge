## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.80.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.vnic01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.nsg01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.puip01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.dkgp](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.sub01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet01](https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_ssh_key_path"></a> [admin\_ssh\_key\_path](#input\_admin\_ssh\_key\_path) | Path to the administrator's SSH public key | `string` | `".ssh/admin-vm01.pub"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Username of the administrator | `string` | `"datarisk-admin"` | no |
| <a name="input_image_offer"></a> [image\_offer](#input\_image\_offer) | The offer of the image | `string` | `"0001-com-ubuntu-server-focal"` | no |
| <a name="input_image_publisher"></a> [image\_publisher](#input\_image\_publisher) | The publisher of the image | `string` | `"Canonical"` | no |
| <a name="input_image_sku"></a> [image\_sku](#input\_image\_sku) | The SKU of the image | `string` | `"20_04-lts"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | The version of the image | `string` | `"latest"` | no |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | Name of the network interface (NIC) | `string` | `"nic-vm-linux01"` | no |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Name of the Network Security Group (NSG) | `string` | `"nsg-01"` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | Storage account type for the OS disk | `string` | `"Standard_LRS"` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Name of the public IP | `string` | `"ip-vm-linux01"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group | `string` | `"eastus2"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | `"datarisk"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet | `string` | `"sub-01"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine | `string` | `"vm-linux01"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size of the virtual machine | `string` | `"Standard_B2ms"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network (VNet) | `string` | `"vnet-01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm01_id"></a> [vm01\_id](#output\_vm01\_id) | n/a |
| <a name="output_vm01_name"></a> [vm01\_name](#output\_vm01\_name) | n/a |
| <a name="output_vm01_size"></a> [vm01\_size](#output\_vm01\_size) | n/a |
