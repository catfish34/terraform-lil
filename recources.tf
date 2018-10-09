resource "aws_vpc" "environment-example-two" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
   Name = "Terraform-aws-vpc-example-two"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.environment-example-two.id}"
  availability_zone = "eu-central-1a"
  tags {
    Name = "subnet1"
  }
}

resource "aws_security_group" "subnetsequrity" {
  vpc_id = "${aws_vpc.environment-example-two.id}"
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
  tags {
    Name = "terraform test SD"
  }
}