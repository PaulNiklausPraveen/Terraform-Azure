output "Azure_Webapp_URL" {
  value = azurerm_linux_web_app.azwebapp.default_hostname 
}

output "Azure_WebApp_IPS" {
  value = azurerm_linux_web_app.azwebapp.outbound_ip_addresses
}
