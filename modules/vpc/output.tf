variable "region" {
    value = var.region
}

variable "project_name" {
    value = var.project_name
}

variable "vpc_id" {
    value = aws_vpc.london.id
}

variable "public_subnet_1_id" {
    value = aws_subnet.public_subnet_1.id
}

variable "public_subnet_2_id" {
    value = aws_subnet.public_subnet_2.id
}

variable "private_app_subnet_1_id" {
    value = aws_subnet.private_app_subnet_2.id
}

variable "private_app_subnet_2_id" {
    value = aws_subnet.private_app_subnet_2.id
}

variable "private_data_subnet_1_id" {
    value = aws_subnet.private_data_subnet_1.id
}

variable "private_data_subnet_2_id" {
    value = aws_subnet.private_data_subnet_2.id
}

variable "internet_gateway" {
    value = aws_internet_gateway.internet_gateway
}