provider "aws" {
  region = "us-south-1" # Change this to your desired region
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  subnet_id = module.subnets.public_subnet_ids[0] # Change this based on your requirements
}

module "ebs_volume" {
  source = "./modules/ebs_volume"
  availability_zone = module.ec2_instance.availability_zone
  size = 20 # Change this to the desired EBS volume size in GB
  device_name = "/dev/sdh" # Change this to the desired device name for the EBS volume
}
