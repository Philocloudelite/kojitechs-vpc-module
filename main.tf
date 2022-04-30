

locals {
  vpc_id     = try(aws_vpc.Kojitechs[0].id, "")
  create_vpc = var.create_vpc
}


#  To access a resource id of a single instance like aws_vpc.Kojitechs.id
# To access a resource id of a count objeect is df aws_vpc.Kojitechs[0].id
resource "aws_vpc" "Kojitechs" {
  count = local.create_vpc ? 1 : 0

  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.dns_support
  enable_dns_hostnames = var.enable_dns_hostname

}

resource "aws_internet_gateway" "igw" {
  count = local.create_vpc ? 1 : 0

  vpc_id = local.vpc_id

}

# creating public subnet
resource "aws_subnet" "public_subnet" {
  count = local.create_vpc ? length(var.cidr_pubsubnet) : 0

  vpc_id                  = local.vpc_id
  cidr_block              = var.cidr_pubsubnet[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.pub_availability_zone[count.index]

  tags = {
    "Name" = "public_subnet_${count.index + 1}"
  }
}


resource "aws_subnet" "priv_sub" {
  count = local.create_vpc ? length(var.cidr_privsubnet) : 0

  vpc_id                  = local.vpc_id
  cidr_block              = var.cidr_privsubnet[count.index]
  availability_zone       = var.priv_availability_zone[count.index]

  tags = {
    "Name" = "priv-sub-${var.priv_availability_zone[count.index]}"
  }
}

# creating dababase subnet
resource "aws_subnet" "database_sub" {
  count = local.create_vpc ? length(var.cidr_database) : 0

  vpc_id            = local.vpc_id
  cidr_block        = var.cidr_database[count.index]
  availability_zone = var.database_availability_zone[count.index]

  tags = {
    "Name" = "database-sub-${var.database_availability_zone[count.index]}"
  }
}

# creating routes
resource "aws_route_table" "route_table" {
  vpc_id = local.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = try(aws_internet_gateway.igw[0].id)
  }

}


resource "aws_route_table_association" "route_tables_ass" {
  count = local.create_vpc ? length(var.cidr_pubsubnet) : 0

  subnet_id      = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.route_table.id
}

# creating the default route table
resource "aws_default_route_table" "default_route" {
  count = (local.create_vpc && var.enable_natgateway)? 1 : 0

  default_route_table_id = try(aws_vpc.Kojitechs[0].default_route_table_id, "")

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = try(aws_nat_gateway.ngw_1[0].id, "")
  }
}

resource "aws_eip" "eip" {
  count = (local.create_vpc && var.enable_natgateway)? 1 : 0
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

}

# creating nat gateway
resource "aws_nat_gateway" "ngw_1" {
  count = (local.create_vpc && var.enable_natgateway)? 1 : 0

  allocation_id = aws_eip.eip[0].id
  subnet_id     = aws_subnet.public_subnet[0].id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "gw_NAT"
  }
}
