
provider "aws" {
    region = "us-east-1"
    profile = "default"
}


module vpc {
    source = "git::https://github.com/Philocloudelite/kojitechs-vpc-module.git"

    vpc_cidr = "10.0.0.0.0/16"
    cidr_pubsubnet = ["10.0.2.0/24", "10.0.4.0/24"]
    pub_aavailability_zone = ["us-east-1a", "us-east-1b"]  
    priv_availability_zone = ["us-east-1c', "us-east-ic"]
    cidr_database = ["10.0.5.0/24", "10.0.7.0/24"]
    database_availability_zone = ['us-east-1d", "us-east-1e"]

    enable_natgateway = true

}