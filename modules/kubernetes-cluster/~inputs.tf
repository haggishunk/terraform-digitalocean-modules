variable project_tags {
  type    = list(string)
  default = []
}

variable cluster_tags {
  type    = list(string)
  default = []
}

variable name {
  type = string
}

variable region {
  type    = string
  default = "sfo3"
}

variable kubernetes_version {
  type    = string
  default = null
}

variable vpc_uuid {
  type    = string
  default = null
}

variable auto_upgrade {
  type    = bool
  default = null
}

variable surge_upgrade {
  type    = bool
  default = null
}

variable node_pool_size {
  type    = string
  default = "s-1vcpu-2gb"
}

variable node_pool_count {
  type    = number
  default = null
}

variable node_pool_auto_scale {
  type    = bool
  default = null
}

variable node_pool_max_nodes {
  type    = number
  default = null
}

variable node_pool_min_nodes {
  type    = number
  default = null
}

variable node_pool_tags {
  type    = list(string)
  default = []
}

variable node_pool_labels {
  type    = map(string)
  default = null
}
