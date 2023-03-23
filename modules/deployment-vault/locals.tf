locals {
  # simple naming
  name = coalesce(var.name, var.project_name)

  # everything this module creates gets these
  module_tags = [
    "role:secrets",
    "app:vault",
  ]

  tags = toset(concat(
    local.module_tags,
    var.tags,
  ))

  # matches dns record hostname provided by `do/deployment` module
  hostname = "${var.name}.${var.domain}"

  cloudinit_config_parts = merge(
    var.cloudinit_config_parts,
    var.certs_enabled ? {
      "cloud-config" = {
        content_type = "text/cloud-config"
        content = templatefile(
          "./files/cloud-config-main.yaml",
          {
            persistent_mount = var.volume_mount
            https_port       = var.https_port
            https_addr       = "0.0.0.0"
            api_addr         = "127.0.0.1"
            tls_cert_b64     = var.tls_cert_b64
            tls_key_b64      = var.tls_key_b64
            ca_cert_b64      = var.ca_cert_b64
          },
        )
      }
    } : {},
    var.certbot_enabled ? {
      "cloud-config" = {
        content_type = "text/cloud-config"
        content = templatefile(
          "./files/cloud-config-certbot.yaml",
          {
            persistent_mount   = var.volume_mount
            https_port         = var.https_port
            https_addr         = "0.0.0.0"
            api_addr           = "127.0.0.1"
            hostname           = local.hostname
            digitalocean_token = var.digitalocean_token
            certbot_email      = var.certbot_email
          },
        )
      }
    } : {},
  )

  inbound_rules = merge(
    var.inbound_rules,
    {
      "https" = {
        port_range       = var.https_port
        protocol         = "tcp"
        source_addresses = var.client_source_addresses
        source_tags      = ["access:${var.name}"]
      }
    }
  )
}
