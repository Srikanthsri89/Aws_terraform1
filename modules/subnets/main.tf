variable "vpc_id" {}

resource "aws_subnet" "public" {
  count = 2
  vpc_id = var.vpc_id
  cidr_block = "10.0.1.${count.index * 16}/28" # Change this based on your desired public subnet CIDR block
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = var.vpc_id
  cidr_block = "10.0.2.${count.index * 16}/28" # Change this based on your desired private subnet CIDR block
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
