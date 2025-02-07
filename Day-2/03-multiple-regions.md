# Multiple Region Implementation in Terraform

You can make use of `alias` keyword to implement multi region infrastructure setup in
terraform.

```
provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-west-2"
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
  provider = "aws.us-east-1"
}

resource "aws_instance" "example2" {
  ami = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
  provider = "aws.us-west-2"
}


provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}
provider "aws" {
  alias = "eu-west-1"
  region = "eu-west-1"
}

resource "aws_instance" "sush-inst1" {
    ami           = "ami-04b4f1a9cf54c11d0"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    subnet_id = "subnet-00d1ab063013750e4"
    key_name = "ec1-key1"
    provider = "aws.us-east-1"
}
resource "aws_instance" "sush-inst3" {
    ami           = "ami-04b4f1a9cf54c11d0"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    subnet_id = "subnet-00d1ab063013750e4"
    key_name = "ec1-key1"
    provider = "aws.eu-west-1"
}
```
