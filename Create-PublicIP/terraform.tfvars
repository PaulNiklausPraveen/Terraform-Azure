resourcegroup1 = "terraform-rg"
location1      = "North Europe"
vnet1 = {
  name          = "virtual_network_1"
  address_space = "10.0.0.0/16"
}
subneta = {
  name          = "Subnet_A"
  address_space = "10.0.0.0/24"
}
subnetb = {
  name          = "Subnet_B"
  address_space = "10.0.1.0/24"
}
interface1    = "intinterface1"
publicip1name = "publicip1"