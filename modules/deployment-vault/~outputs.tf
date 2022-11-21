output "droplet_dnsname" {
  value = var.dns_enabled ? module.deployment.droplet_dnsname : null
}

output "reserved_ip" {
  value = var.reserved_ip_enabled ? module.deployment.reserved_ip : null
}

output "droplet_ip" {
  value = module.deployment.droplet_ip
}

output "cloudinit_configs" {
  value       = var.cloudinit_enabled ? keys(local.cloudinit_config_parts) : null
  description = "A list of enabled cloudinit configurations"
}

output "deployment_tags" {
  value = module.deployment.deployment_tags
}

output "tags" {
  value = module.deployment.tags
}

output "firewall_tags" {
  value = module.deployment.firewall_tags
}

output "cloudinit_rendered" {
  value     = var.cloudinit_enabled ? module.deployment.cloudinit_rendered : null
  sensitive = true # inspect state to debug rendered cloudinit parts
}

output "droplet_image" {
  value = module.deployment.droplet_image
}

output "volume_id" {
  value = var.volume_enabled ? module.deployment.volume_id : null
}

output "volume_name" {
  value = var.volume_enabled ? module.deployment.volume_name : null
}

output "volume_region" {
  value = var.volume_enabled ? module.deployment.volume_region : null
}

output "volume_snapshot_id" {
  value = var.volume_enabled ? module.deployment.volume_snapshot_id : null
}

output "volume_snapshot_filesystem_type" {
  value = var.volume_enabled ? module.deployment.volume_snapshot_filesystem_type : null
}
