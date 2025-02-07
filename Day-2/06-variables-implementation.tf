# Variables Demo

```hcl

# Define an input variable for the EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Define an input variable for the EC2 instance AMI ID
variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
}

# Configure the AWS provider using the input variables
provider "aws" {
  region      = "us-east-1"
}

# Create an EC2 instance using the input variables
resource "aws_instance" "example_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

# Define an output variable to expose the public IP address of the EC2 instance
output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example_instance.public_ip
}




---------- MY example ------
variable "aws_instance_type" {
  description = "Input variable -- instance type"
  type        = string
  default     = "t2.micro"  
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

resource "aws_instance" "sush-inst1" {
    ami           = "ami-04b4f1a9cf54c11d0"  # Specify an appropriate AMI ID
    instance_type = var.aws_instance_type
    subnet_id = "subnet-00d1ab063013750e4"
    key_name = "ec1-key1"
    provider = "aws.us-east-1"
    tags = {
    Name        = "Inst1sushma"
    Owner       = "sushma"
  }
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.sush-inst1.public_ip
  #here sush-inst1 is not ec2 name...its just and resource type and resource
 # Name        = "Inst1sushma" is the ec2 name

}

Terminal :
Outputs:

public_ip = "3.237.2.156"


```
