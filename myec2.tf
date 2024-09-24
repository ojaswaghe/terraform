locals {
# ami  = "ami-02b49a24cfb95941c"
# type = "t2.micro"
# tags = {
#   Name = "My Virtual Machine"
#   Env  = "Dev"
# }
# subnet = "subnet-0557f551f1666d6e2"
# nic    = aws_network_interface.my_nic.id
}

#resource "aws_key_pair" "mykeypair" {
#  key_name   = "http2" # The name of your existing key pair
#  public_key = file("C:/Users/Dell/.ssh/http2.pem") # Path to your PEM file
#}



resource "aws_instance" "myvm" {
 ami           = var.ami
 instance_type = var.type
 key_name = var.keypair
 vpc_security_group_ids = var.sg
 count = 1
 tags          = var.tags

 root_block_device {
    volume_size = 15 # Size of the root volume in GB
    volume_type = "gp3"
  }
 
 #network_interface {
  # network_interface_id = local.nic
   #device_index         = 0
 #}
}
 
#resource "aws_network_interface" "my_nic" {
# description = "My NIC"
# subnet_id   = var.subnet
# 
# tags = {
#   Name = "My NIC"
# }
#}