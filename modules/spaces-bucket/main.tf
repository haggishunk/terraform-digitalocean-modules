resource "digitalocean_spaces_bucket" "this" {
  name          = var.name
  region        = var.region
  acl           = var.acl
  force_destroy = var.force_destroy

  dynamic "versioning" {
    for_each = var.versioning_enabled ? [1] : []
    content {
      enabled = each.value
    }
  }

  dynamic "cors_rule" {
    for_each = var.cors_rule != null ? [1] : []
    content {
      allowed_headers = lookup(var.cors_rule, "allowed_headers")
      allowed_methods = lookup(var.cors_rule, "allowed_methods")
      allowed_origins = lookup(var.cors_rule, "allowed_origins")
      max_age_seconds = lookup(var.cors_rule, "max_age_seconds")
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule != null ? [1] : []
    content {
      id                                     = lookup(var.lifecycle_rule, "id", null)
      prefix                                 = lookup(var.lifecycle_rule, "prefix", null)
      enabled                                = lookup(var.lifecycle_rule, "enabled", null)
      abort_incomplete_multipart_upload_days = lookup(var.lifecycle_rule, "abort_incomplete_multipart_upload_days", null)

      dynamic "expiration" {
        for_each = var.lifecycle_rule.expiration != null ? [1] : []
        content {
          date                         = lookup(var.lifecycle_rule.expiration, "date")
          days                         = lookup(var.lifecycle_rule.expiration, "days")
          expired_object_delete_marker = lookup(var.lifecycle_rule.expiration, "expired_object_delete_marker")
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = var.lifecycle_rule.noncurrent_version_expiration != null ? [1] : []
        content {
          days = lookup(var.lifecycle_rule.expiration, "days")
        }
      }
    }
  }
}

resource "digitalocean_spaces_bucket_object" "ballast" {
  for_each     = var.ballast ? toset(["enabled"]) : toset([])
  region       = digitalocean_spaces_bucket.this.region
  bucket       = digitalocean_spaces_bucket.this.name
  key          = "__ballast__.json"
  content      = jsonencode({ "ballast" = true })
  content_type = "application/json"
}
