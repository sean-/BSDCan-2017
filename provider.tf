provider "triton" {
  account      = "${var.triton_account_name}"
  key_material = "${file(var.triton_key_material)}"
  key_id       = "${var.triton_key_id}"
  url          = "${var.triton_url}"
}
