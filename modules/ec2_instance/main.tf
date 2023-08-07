variable "subnet_id" {}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Change this to your desired AMI ID
  instance_type = "t2.micro" # Change this to your desired instance type
  subnet_id     = var.subnet_id
  tags = {
    Name = "Example EC2 Instance"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}

output "availability_zone" {
  value = aws_instance.example.availability_zone
}
