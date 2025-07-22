variable "ami" {
  description = "The AMI to use for the EC2 instances"
  type        = string
  default     = "ami-0c1ac8a41498c1a9c" # Example for Amazon Linux 2 in eu-north-1
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instances"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instances"
  type        = string
}

variable "avail_zone" {
  description = "The availability zone to deploy instances into"
  type        = string
  default     = "eu-north-1a"
}
