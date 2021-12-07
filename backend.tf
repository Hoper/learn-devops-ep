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
    bucket  = "terr-state-ff09f6e5364299e6b409"   # 
}