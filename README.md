This module consists of a resource group (in "vnet-subnet.tf" file), a storage account (standard LRS) which will have containers for each vm that will be created, one virtual network that has 3 subnets, a public load balancer (with rules for port 80 and port 443 and its probes) which uses an availability set as a backend pool, a public IP address which will be used by the load balancer and multiple virtual machines (UbuntuServer-Standard_DS1_v2) which will be associated to backend pool of loadbalancer. If you use the template as it is you will have only 2 virtual machines but it is possible to set the number of VMs in variables.tf under the "arm_frontend_instances" variable block. If you "terraform apply" it you will have an environment as shown in the picture below.

![Alt text](terraform-sample%20(2).png)



This module will use a specific Azure storage account as a backend to keep our terraform.tfstate . You can change the storage account from the "backend.tf" file to your desired location.



Variables:


arm_region = The Azure region to create things in.

arm_frontend_instances = The number of the VMs, storage containers.

arm_vm_admin_password = Passwords for the root user in VMs.


Outputs

frontend_id = azurerm_subnet.my_subnet_frontend.id

backend_id = azurerm_subnet.my_subnet_backend.id

load_balancer_ip = azurerm_public_ip.frontend.ip_address





You can see the providers, resources, inputs and outputs more detailed in the chart below. 


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/availability_set) | resource |
| [azurerm_lb.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.port443](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_probe.port80](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.port443](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_rule) | resource |
| [azurerm_lb_rule.port80](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_rule) | resource |
| [azurerm_network_interface.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_backend_address_pool_association.ba_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_public_ip.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.terraform_sample](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/storage_container) | resource |
| [azurerm_subnet.my_subnet_backend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | resource |
| [azurerm_subnet.my_subnet_dmz](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | resource |
| [azurerm_subnet.my_subnet_frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | resource |
| [azurerm_virtual_machine.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_network.my_vn](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arm_frontend_instances"></a> [arm\_frontend\_instances](#input\_arm\_frontend\_instances) | Number of front instances | `number` | `2` | no |
| <a name="input_arm_region"></a> [arm\_region](#input\_arm\_region) | The Azure region to create things in. | `string` | `"East US"` | no |
| <a name="input_arm_vm_admin_password"></a> [arm\_vm\_admin\_password](#input\_arm\_vm\_admin\_password) | Passwords for the root user in VMs. | `string` | `"SUper.123-"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_id"></a> [backend\_id](#output\_backend\_id) | n/a |
| <a name="output_dmz_id"></a> [dmz\_id](#output\_dmz\_id) | n/a |
| <a name="output_frontend_id"></a> [frontend\_id](#output\_frontend\_id) | n/a |
| <a name="output_load_balancer_ip"></a> [load\_balancer\_ip](#output\_load\_balancer\_ip) | n/a |
