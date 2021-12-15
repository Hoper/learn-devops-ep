#Set S3 backend for persisting TF state file remotely, ensure S3 already exits
# And that AWS user being used by TF has read/write perms
terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region  = "us-east-1"
    profile = "my-awsuser"
    key     = "terraformstatefile"
    bucket  = "terr-state-8f583b7e514c8485e8b1"   # "terr-state-0b4596d74b0589dd3377"   # "terr-state-66020c021917a0fc382a"   
  }
} 