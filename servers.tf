resource "triton_machine" "my-freebsd-server" {
  count = 1
  name  = "my-freebsd${format("%02d", count.index + 1)}"

  image   = "${var.my_image_id}"
  package = "${var.my_package_size}"

  nic {
    network = "${var.network_id}"
  }

  firewall_enabled = false # Not covered in this example

  # Arbitrary tags, useful with firewalls rules
  tags = {
    freebsd    = "11"
    app        = "my-image-app"
    image_type = "freebsd"
  }
}
