variable "region" {
  type    = string
  description = "The AWS region for the S3 bucket"
}
variable "ami" {
  description = "This is AMI for the instance"
}

variable "instance_type" {
  description = "This is the instance type, for example: t2.micro"
}