variable "network_id" {
  type = "string"
  description = "Network ID to use for the image"
}

variable "my_image_id" {
  type = "string"
}

variable "my_package_size" {
  type        = "string"
  description = "Size of the image to create"

  # Package name from `make packages`
  default = "k4-highcpu-kvm-250M"
}

variable "triton_account_name" {
  type        = "string"
  description = "Triton account information"
}

variable "triton_key_id" {
  type = "string"
}

variable "triton_key_material" {
  type    = "string"
  default = "~/.ssh/id_rsa"
}

variable "triton_url" {
  type    = "string"
  default = "https://us-west-1.api.joyentcloud.com"
}
