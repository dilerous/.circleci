# Version 5

resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = "brad.bucket"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "S3 Remote Terraform State Store"
    }
}

terraform {
 backend “s3” {
 encrypt = true
 bucket = "brad.bucket"
 region = us-west-2
 key = "${var.bucket_key}"
 }
}

provider "aws" {
  region = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_instance" "RadditwithFile" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  count = 1
  key_name   = "Default"
  security_groups = ["launch-wizard-1"]
}
