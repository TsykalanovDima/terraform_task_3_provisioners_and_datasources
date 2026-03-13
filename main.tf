resource "null_resource" "nginx_setup" {
  triggers = {
    vm_id      = data.azurerm_virtual_machine.main.id
    public_ip  = data.azurerm_public_ip.main.ip_address
    index_hash = filesha256("${path.module}/index.html")
  }

  connection {
    type     = "ssh"
    host     = data.azurerm_public_ip.main.ip_address
    user     = var.admin_username
    password = var.admin_password
    timeout  = "10m"
  }

  provisioner "remote-exec" {
    inline = [
      "while sudo fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do sleep 5; done",
      "sudo apt-get update",
      "sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nginx",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo chown root:root /var/www/html/index.html",
      "sudo systemctl enable nginx",
      "sudo systemctl restart nginx",
    ]
  }

}

output "vm_public_ip" {
  value = data.azurerm_public_ip.main.ip_address
}

output "nginx_url" {
  value = "http://${data.azurerm_public_ip.main.ip_address}"
}
