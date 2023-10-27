variable "name" {
  type = string
}

variable "region" {
  type = string
  validation {
    condition = can(index([
      "ams2",
      "ams3",
      "blr1",
      "fra1",
      "lon1",
      "nyc1",
      "nyc2",
      "nyc3",
      "sfo1",
      "sfo2",
      "sfo3",
      "sgp1",
      "syd1",
      "tor1",
    ], var.region))
    error_message = "Invalid region"
  }
}

variable "ip_range" {
  type = string
  validation {
    condition = can(regex(
      "^\\d+\\.\\d+\\.\\d+\\.\\d+\\/\\d+$",
      var.ip_range
    ))
    error_message = "Invalid CIDR format. It should be in the form of 'x.x.x.x/x'."
  }
}

variable "description" {
  type = string
}
