# create vpc
resource "aws_vpc" "london" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "${project_name}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.london.id

  tags      = {
    Name    = "${project_name}-igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.london.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public_subnet_1"
  }
}

# create public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.london.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public_subnet_2"
  }
}

# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.london.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "public_route_table"
  }
}

# associate public subnet 1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet 2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_2.id
  route_table_id      = aws_route_table.public_route_table.id
}

# create private app subnet 1
resource "aws_subnet" "private_app_subnet_1" {
  vpc_id                   = aws_vpc.london.id
  cidr_block               = var.private_app_subnet_1_cidr
  availability_zone        = ws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_app_subnet_1"
  }
}

# create private app subnet 2
resource "aws_subnet" "private_app_subnet_2" {
  vpc_id                   = aws_vpc.london.id
  cidr_block               = var.private_app_subnet_2_cidr
  availability_zone        = ws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_app_subnet_2"
  }
}

# create private data subnet 1
resource "aws_subnet" "private_data_subnet_1" {
  vpc_id                   = aws_vpc.london.id
  cidr_block               = var.private_data_subnet_1_cidr
  availability_zone        = ws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_data_subnet_1"
  }
}

# create private data subnet 2
resource "aws_subnet" "private_data_subnet_2" {
  vpc_id                   = aws_vpc.london.id
  cidr_block               = var.private_data_subnet_2_cidr
  availability_zone        = aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_data_subnet_2"
  }
}