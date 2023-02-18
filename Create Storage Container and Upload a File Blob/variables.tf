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
variable "file" { 
    description = "The name of the storage blob"    
}
variable "blobtype"{    
    description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created."
}
variable "filelocation"{
 description = "An absolute path to a file on the local system"
}
variable "container1"{ 
    type        = string   
}
variable "container_access_type" {  
}