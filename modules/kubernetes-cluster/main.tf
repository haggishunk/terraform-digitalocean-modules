data "digitalocean_kubernetes_versions" "this" {}

locals {
  cluster_tags = concat(var.project_tags, var.cluster_tags)

  node_pool_tags = concat(local.cluster_tags, var.node_pool_tags)

  node_pool_name = "${var.name}-primary"

  kubernetes_version = var.kubernetes_version == null ? data.digitalocean_kubernetes_versions.this.latest_version : var.kubernetes_version
}

resource "digitalocean_kubernetes_cluster" "this" {
  name          = var.name
  region        = var.region
  version       = local.kubernetes_version
  vpc_uuid      = var.vpc_uuid
  auto_upgrade  = var.auto_upgrade
  surge_upgrade = var.surge_upgrade
  tags          = local.cluster_tags

  node_pool {
    name       = local.node_pool_name
    size       = var.node_pool_size
    node_count = var.node_pool_count
    auto_scale = var.node_pool_auto_scale
    min_nodes  = var.node_pool_min_nodes
    max_nodes  = var.node_pool_max_nodes
    tags       = local.node_pool_tags
    labels     = var.node_pool_labels
  }
}
