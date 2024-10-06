variable "ami" {
 type        = string
 description = "AMI ID for the EC2 instance"
 default     = "ami-09b0a86a2c84101e1"  # ubuntu 22.04
 
 validation {
   condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
   error_message = "Please provide a valid value for variable AMI."
 }
}
 
variable "type" {
 type        = string
 description = "Instance type for the EC2 instance"
 default     = "t2.large"
 #sensitive   = true
}


variable "keypair" {
 type        = string
 description = "Key pair for the EC2 instance"
 default     = "http2" 
}


variable "sg" {
 type        = set(string)
 description = "Security group ID for the EC2 instance"
 default     = ["sg-0218cee1e44d762db"] 
}


variable "tags" {
 type = object({
   Name = string
   Env  = string
 })
 description = "Tags for the EC2 instance"
 default = {
   Name = "jenkins-node"
   Env  = "Dev"
 }
}
 
variable "subnet" {
 type        = string
 description = "Subnet ID for network interface"
 default     = "subnet-0557f551f1666d6e2"
}

#output "myinstance_details" {
# value       = aws_instance.myvm.public_ip
# description = "AWS EC2 public ID"
# sensitive   = false
#}

output "myinstance_public_id" {
 value       = aws_instance.myvm[*].public_ip
 description = "AWS EC2 ID"
 sensitive   = false
}