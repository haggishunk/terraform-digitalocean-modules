Notes: Supplied tags are filtered to specific scope

Example usage:

```
  project_name        = "demo-project"
  name                = "coolapp"
  size                = "s-1vcpu-2gb"
  image_slug          = "debian-9-x64"
  region              = "sfo3"
  private_networking  = true
  monitoring          = true
  ssh_enabled         = true
  ssh_keys_names      = ["mykey"]
  domain              = "example.com"
  dns_enabled         = true
  reserved_ip_enabled = true
  volume_enabled      = true
  volume_name         = "docker"          # the device id name
  volume_mount        = "/var/lib/docker" # where to mount it
  volume_size         = 100
  cloudinit_enabled   = true


  inbound_rules = {
    "coolapp-listen" = {
      port_range = "80"
      protocol   = "tcp"

      source_addresses = [
        "0.0.0.0/0",
      ]
    }
  }

  tags = [
    "role:demo",
    "app:coolapp",
  ]
```
