data "digitalocean_domain" "this" {
  count = var.dns_enabled ? 1 : 0
  name  = var.domain
}

data "digitalocean_ssh_keys" "this" {
  filter {
    key    = "name"
    values = var.ssh_keys_names
  }
}

data "digitalocean_tag" "this" {
  for_each = toset(local.firewall_tags)
  name     = each.value
}

data "digitalocean_images" "this" {
  # common-sense region selection
  filter {
    key    = "regions"
    values = [var.region]
  }

  # ad-hoc + computed user filters
  dynamic "filter" {
    for_each = local.image_filters
    content {
      key      = filter.value.key
      values   = filter.value.values
      match_by = filter.value.match_by
      all      = filter.value.all
    }
  }

  # optional latest selection
  dynamic "sort" {
    for_each = var.image_latest ? { "created" = "desc" } : var.image_sort
    content {
      key       = sort.key
      direction = sort.value
    }
  }
}
