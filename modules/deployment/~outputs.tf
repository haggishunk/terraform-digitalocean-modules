output "droplet_dnsname" {
  value = var.dns_enabled ? digitalocean_record.this.0.fqdn : null
}

output "reserved_ip" {
  value = var.reserved_ip_enabled ? digitalocean_reserved_ip.this.0.ip_address : null
}

output "droplet_ip" {
  value = digitalocean_droplet.this.ipv4_address
}

output "cloudinit_configs" {
  value       = var.cloudinit_enabled ? keys(local.cloudinit_config_parts) : null
  description = "A list of enabled cloudinit configurations"
}

output "deployment_tags" {
  value = var.tags
}

output "tags" {
  value = local.tags
}

output "firewall_tags" {
  value = local.firewall_tags
}

output "cloudinit_rendered" {
  value     = var.cloudinit_enabled ? data.cloudinit_config.this.0.rendered : null
  sensitive = true # inspect state to debug rendered cloudinit parts
}

output "droplet_image" {
  value = data.digitalocean_images.this.images.0
}

output "volume_id" {
  value = var.volume_enabled ? digitalocean_volume.data[0].id : null
}

output "volume_name" {
  value = var.volume_enabled ? digitalocean_volume.data[0].name : null
}

output "volume_region" {
  value = var.volume_enabled ? digitalocean_volume.data[0].region : null
}

output "volume_snapshot_id" {
  value = var.volume_enabled ? digitalocean_volume.data[0].snapshot_id : null
}

output "volume_snapshot_filesystem_type" {
  value = var.volume_enabled ? digitalocean_volume.data[0].filesystem_type : null
}
