output "default_hostname" {
  value = azurerm_static_web_app.ra_website.default_host_name
}

output "api_key" {
  value     = azurerm_static_web_app.ra_website.api_key
  sensitive = true
}
