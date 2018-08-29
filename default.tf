# Version 1

provider "aws" {
  region = "us-east-1"
  access_key = "${Access}"
  secret_key = "${Secret}"
}

resource "aws_instance" "RadditwithFile" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  count = 1
  key_name   = "Default"
  security_groups = ["launch-wizard-1"]
}
