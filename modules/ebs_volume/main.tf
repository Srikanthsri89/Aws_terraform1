variable "availability_zone" {}
variable "size" {}
variable "device_name" {}

resource "aws_ebs_volume" "example" {
  availability_zone = var.availability_zone
  size              = var.size
}

resource "aws_volume_attachment" "example" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.example.id
  instance_id = module.ec2_instance.instance_id
}

output "volume_id" {
  value = aws_ebs_volume.example.id
}
