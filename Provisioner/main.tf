provider "aws" {
  region = var.region
}
resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "test"
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/Digital Suppliers/Downloads/test.pem")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "D:/Project/Terraform-Provisioner/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo service nginx start" 
    ]
  }
}