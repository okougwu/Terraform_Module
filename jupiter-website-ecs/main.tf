providers "aws" {
    region = var.region
    profile = "munachi"
}

#create vpc
module "Aguoko" {
    source = "../modules/vpc/"
    region                     = var.region
    project_name               = var.project_name
    vpc_cidr                   = var.vpc_cidr
    public_subnet_1_cidr       = var.public_subnet_1_cidr
    public_subnet_2_cidr       = var.public_subnet_2_cidr
    private_app_subnet_1_cidr  = var.private_app_subnet_1_cidr
    private_app_subnet_2_cidr  = var.private_app_subnet_2_cidr
    private_data_subnet_1_cidr = var.private_data_subnet_1_cidr
    private_data_subnet_2_cidr = var.private_data_subnet_2_cidr
}
