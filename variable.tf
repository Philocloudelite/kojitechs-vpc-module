
variable "vpc_cidr" {
  type        = string
  description = "provide vpc cidr"
}


variable "dns_support" {
  type        = bool
  description = "anable dns support"
  default = null
}

variable "enable_dns_hostname" {
  type        = bool
  description = "anable dns host name"
  default = null
}


variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "aws region"
}


variable "cidr_pubsubnet" {
  type        = list(any)
  description = "list of public cidrs"
}

variable "pub_aavailability_zone" {
  type        = list
  description = "provide the aavailability_zone for pub subnet["
}

variable "priv_availability_zone" {
  type        = list(any)
  description = "provide the aavailability_zone for priv subnet"
}


variable "cidr_database" {
  type        = list(any)
  description = "list of database cidrs"
}

variable "database_availability_zone" {
  type        = list
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

