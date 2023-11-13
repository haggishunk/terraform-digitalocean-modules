variable "name" {
  type = string
}
variable "region" {
  type = string
}
variable "versioning_enabled" {
  type    = bool
  default = false
}
variable "acl" {
  type = string
  validation {
    condition     = can(index(["private", "public-read"], var.acl))
    error_message = "Must be `private` or `public-read`"
  }
}
variable "force_destroy" {
  type    = bool
  default = false
}

variable "cors_rule" {
  type = object({
    allowed_headers = optional(list(string))
    allowed_methods = list(string)
    allowed_origins = list(string)
    max_age_seconds = optional(number)
  })
  default = null
}

variable "lifecycle_rule" {
  type = object({
    id                                     = optional(string)
    prefix                                 = optional(string)
    enabled                                = bool
    abort_incomplete_multipart_upload_days = optional(number)
    expiration = optional(object({
      date                         = optional(string)
      days                         = optional(number)
      expired_object_delete_marker = optional(bool)
    }))
    noncurrent_version_expiration = optional(object({
      days = optional(number)
    }))
  })
  default = null
}

