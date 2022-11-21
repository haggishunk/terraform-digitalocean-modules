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

  cloudinit_config_parts = merge(
    var.cloudinit_config_parts,
    {
      "cloud-config" = {
        content_type = "text/cloud-config"
        content = templatefile(
          "./files/cloud-config.yaml",
          {
            persistent_mount = var.volume_mount
            https_port       = var.https_port
            https_addr       = "0.0.0.0"
            api_addr         = "127.0.0.1"
            tls_cert_b64     = var.tls_cert_b64
            tls_key_b64      = var.tls_key_b64
            ca_cert_oneline  = var.ca_cert_oneline
          },
        )
      }
    }
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
