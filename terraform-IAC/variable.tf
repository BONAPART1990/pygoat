variable "name" {
  description = "Suffix to be used in resource names"
  type        = string
  default     = "shahbaz-devsecops"
  
}

variable "myenv" {
  description = "Prefix to be used in resource names"
  type        = string
  default     = "test"
  
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "West US 2"
  
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "shahbazdemo12131"
  
}