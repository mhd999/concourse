provider "aws" {
  version = "1.33.0"
  region  = "eu-west-1"

  allowed_account_ids = ["789126105642"]

  # Doesn't work with MFA's yet.
  # https://github.com/terraform-providers/terraform-provider-aws/issues/5078
  # assume_role {
  #   role_arn = "arn:aws:iam::<account-number>:role/admin"
  # }

  # Make it faster by skipping something
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
}

terraform {
  required_version = "0.11.7"

  backend "s3" {
    key            = "account.tfstate"
    bucket         = "789126105642-terraform-state"
    dynamodb_table = "789126105642-terraform-state"
    acl            = "bucket-owner-full-control"
    encrypt        = "true"
    kms_key_id     = "arn:aws:kms:eu-west-1:789126105642:key/3ea5783b-a00c-417f-88f7-228d69bd3eb9"
    region         = "eu-west-1"
  }
}
