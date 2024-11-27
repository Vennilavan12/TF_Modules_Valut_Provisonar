provider "aws" {
  region     = "us-east-2"
  access_key = local.aws_access_key
  secret_key = local.aws_secret_key
}
resource "aws_instance" "example" {
  ami           = "ami-05fb0b8c1424f266b"  # Change to your preferred AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "VaultTerraformExample"
  }
}
output "instance_id" {
  value = aws_instance.example.id
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "instance_public_dns" {
  value = aws_instance.example.public_dns
}
