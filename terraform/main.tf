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
  subscription_id = "ca7824a5-1e57-4c4e-87f0-c8aebbbeea88"
  tenant_id       = "01e413d4-0d2d-48ec-80fc-0b87c981437d"
}

resource "azurerm_resource_group" "ra_website" {
  name     = "ra-website_group"
  location = "westeurope"
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
  validation_type   = "dns-txt-token"
}

