# Creates a vpc

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

output "vpc_name" {
    value = aws_vpc.main.id
}