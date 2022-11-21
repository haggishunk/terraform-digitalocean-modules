module "deployment" {
  source                      = "git::ssh://git@github.com/haggishunk/terraform-digitalocean-modules.git//modules/deployment?ref=firewall-tags-on-droplet"
  ca_trust_enabled            = false # handled by cloudinit
  certs_enabled               = false # handled by cloudinit
  cloudinit_config_parts      = local.cloudinit_config_parts
  cloudinit_enabled           = true
  dns_enabled                 = var.dns_enabled
  domain                      = var.domain
  image_filters               = var.image_filters
  image_id                    = var.image_id
  image_latest                = var.image_latest
  image_name                  = var.image_name
  image_slug                  = var.image_slug
  image_sort                  = var.image_sort
  image_source                = var.image_source
  inbound_rules               = local.inbound_rules
  monitoring                  = var.monitoring
  name                        = local.name
  outbound_rules              = var.outbound_rules
  project_name                = var.project_name
  region                      = var.region
  reserved_ip_enabled         = var.reserved_ip_enabled
  size                        = var.size
  ssh_enabled                 = var.ssh_enabled
  ssh_keys_ids                = var.ssh_keys_ids
  ssh_keys_names              = var.ssh_keys_names
  tags                        = local.tags
  volume_description          = var.volume_description
  volume_enabled              = var.volume_enabled
  volume_fs                   = var.volume_fs
  volume_mount                = var.volume_mount
  volume_name                 = var.volume_name
  volume_size                 = var.volume_size
  volume_snapshot_most_recent = var.volume_snapshot_most_recent
  volume_snapshot_name        = var.volume_snapshot_name
  vpc_uuid                    = var.vpc_uuid
}
