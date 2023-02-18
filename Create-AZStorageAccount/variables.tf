variable "resource_group_location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default = "Terraform"
}

variable "azstorageaccount" {
  default = "azstgaccount"

}
variable "account_tier" {
  type         = string
 
}
variable "replication_type" {
  type                     = string
 
}
variable "account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  type        = string
   
}
