provider "aws" {
  region  = "us-east-1"
  profile = "personal"
  version = "1.58.0"

  assume_role {
    role_arn = "arn:aws:iam::389719579847:role/ops-admin"
  }
}

# Terraform backend does not support interpolation
terraform {
  backend "s3" {
    bucket         = "terraform-389719579847"
    dynamodb_table = "terraform-state-lock"
    key            = "terraform.tfstate"
    kms_key_id     = "arn:aws:kms:us-east-1:389719579847:key/06bd5f44-4129-43a3-b316-2964a351bb9a"
    region         = "us-east-1"
    encrypt        = "true"
    role_arn       = "arn:aws:iam::389719579847:role/ops-admin"
    profile        = "personal"
  }
}
