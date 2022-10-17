variable "resource_group_name" {
  description = "value"
  type        = string
}
variable "location" {
  description = "value"
  type        = string
}
variable "virtual_network" {
  description = "value"
  type        = string
}
#Define the log analytics workspace
variable "log_analytics_workspace_name" {
  type = string
}
#Define the log analytics workspace sku
variable "log_analytics_workspace_sku" {
  type = string
}
variable "total_retention" {
type = number 
}
variable "bsc_key_vault" {
  type = string
}
variable "tenant_id" {
type = string 
}
variable "object_id" {
  type = string
}
variable "synapse_workspace" {
type = string 
}
# variable "folder-ad-group" {
#   type = map(string)
#   default = {
#     "folder_name_1" = "Group1",
#     "folder_name_2" = "Group2",
#     "folder_name_3" = "Group3",
#     "folder_name_4" = "Group4"
#   }
# }