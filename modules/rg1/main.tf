resource "azurerm_resource_group" "testrg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}