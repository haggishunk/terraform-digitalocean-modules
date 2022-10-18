output id {
  value = digitalocean_kubernetes_cluster.this.id
}

output cluster_subnet {
  value = digitalocean_kubernetes_cluster.this.cluster_subnet
}

output service_subnet {
  value = digitalocean_kubernetes_cluster.this.service_subnet
}

output ipv4_address {
  value = digitalocean_kubernetes_cluster.this.ipv4_address
}

output endpoint {
  value = digitalocean_kubernetes_cluster.this.endpoint
}

output status {
  value = digitalocean_kubernetes_cluster.this.status
}

output created_at {
  value = digitalocean_kubernetes_cluster.this.created_at
}

output updated_at {
  value = digitalocean_kubernetes_cluster.this.updated_at
}

output auto_upgrade {
  value = digitalocean_kubernetes_cluster.this.auto_upgrade
}

output kubeconfig {
  value = digitalocean_kubernetes_cluster.this.kube_config.0
}

output node_pool {
  value = digitalocean_kubernetes_cluster.this.node_pool
}
