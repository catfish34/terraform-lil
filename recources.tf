resource "aws_vpc" "environment-example-two" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
   Name = "Terraform-aws-vpc-example-two"
  }
}