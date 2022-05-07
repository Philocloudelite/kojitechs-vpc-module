
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# terraform {

#   backend "s3" {
#     bucket         = "koljitechs.vpcstatebuckets1"
#     key            = "terraform.tfstate"
#     region         = "us-east-1"
#     profile = "terraform"
#     encrypt        = true
#     dynamodb_table = "terraform-lock-backup"
#   }
# }

##  "git::https://github.com/Philocloudelite/kojitechs-vpc-module.git"

module "vpc" {


  source                     = "../"       #"git::https://github.com/Philocloudelite/kojitechs-vpc-module.git"
  vpc_cidr                   = "10.0.0.0/16"
  cidr_pubsubnet             = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24", "10.0.8.0/24", "10.0.10.0/24"]
  pub_availability_zone      = ["us-east-1a", "us-east-1b"]
  priv_availability_zone     = ["us-east-1c", "us-east-1a"]
  cidr_privsubnet            = ["10.0.1.0/24", "10.0.3.0/24"]
  cidr_database              = ["10.0.5.0/24", "10.0.7.0/24"]
  database_availability_zone = ["us-east-1d", "us-east-1e"]

  enable_natgateway = false

}