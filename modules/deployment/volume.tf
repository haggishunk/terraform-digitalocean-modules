resource "digitalocean_volume" "data" {
  count                   = var.volume_enabled ? 1 : 0
  region                  = var.region
  snapshot_id             = var.volume_snapshot_name != null ? data.digitalocean_volume_snapshot.data[0].id : null
  name                    = var.volume_name
  size                    = var.volume_size
  initial_filesystem_type = var.volume_fs
  description             = var.volume_description
  tags                    = local.tags
}

resource "digitalocean_volume_attachment" "data" {
  count      = var.volume_enabled ? 1 : 0
  droplet_id = digitalocean_droplet.this.id
  volume_id  = digitalocean_volume.data.0.id
}

data "digitalocean_volume_snapshot" "data" {
  count       = var.volume_snapshot_name != null ? 1 : 0
  name        = var.volume_snapshot_name
  most_recent = var.volume_snapshot_most_recent
  region      = var.region
}
