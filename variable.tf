
variable "vpc_cidr" {
  type        = string
  description = "provide vpc cidr"
}


variable "dns_support" {
  type        = bool
  description = "anable dns support"
  default     = null
}

variable "enable_dns_hostname" {
  type        = bool
  description = "anable dns host name"
  default     = null
}


variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "aws region"
}

variable "cidr_privsubnet" {
  type        = list(any)
  description = "list of private cidrs"
}


variable "cidr_pubsubnet" {
  type        = list(any)
  description = "list of public cidrs"
}

variable "pub_availability_zone" {
  type        = list(any)
  description = "provide the availability_zone for pub subnet["
}

variable "priv_availability_zone" {
  type        = list(any)
  description = "provide the availability_zone for priv subnet"
}


variable "cidr_database" {
  type        = list(any)
  description = "list of database cidrs"
}

variable "database_availability_zone" {
  type        = list(any)
  description = "provide the aavailability_zone for database subnet"
}

variable "enable_natgateway" {
  type        = bool
  description = "Enable nat gateway | if user says true then create but if user says false then ignore"
}

variable "create_vpc" {
  type        = bool
  default     = true
  description = "create vpc"
}


variable "ami" {
  type        = string
  description = "provide the ami"
}


variable "instance_type" {
  type        = string
  description = "provide the instance type"
}


variable "instance_" {
  type        = string
  description = "provide the ami"
}

variable "subnet_id" {
  type = string
  description = "provide subnet_id"
}

variable "instance_count" {
  default = true
  type = bool
  description = "provide the number of instaance to be created"
}

variable "vpc-security_group_ids" {
    type = list
    description = "list security group ids"
  }

variable "iam_instance_profile" {
  type = string
  description = "provide instance profile"
}

variable "key_name" {
  type = string
  description = "provide key name"
}

