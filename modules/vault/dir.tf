resource "null_resource" "check_dir_existance" {
  triggers = {
    once = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<-EOT
      sudo mkdir -p /mnt/consul_pv   
    EOT
  }
}
