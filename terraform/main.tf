terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "38b66f09-c438-476e-bdfc-4005c0a4a5ac"
  tenant_id       = "3b79a646-3c26-41cf-b144-8eb84dfe71f7"
}

resource "azurerm_resource_group" "ra_website" {
  name     = "ra-website_group"
  location = "West US 2"
}

resource "azurerm_static_web_app" "ra_website" {
  name                = "ra-website"
  resource_group_name = azurerm_resource_group.ra_website.name
  location            = azurerm_resource_group.ra_website.location
  sku_tier            = "Free"
  sku_size            = "Free"

  tags = {}
}

resource "azurerm_static_web_app_custom_domain" "ra_domain" {
  static_web_app_id = azurerm_static_web_app.ra_website.id
  domain_name       = "ricardoandaluz.com"
  validation_type   = "cname-delegation"
}
