# store the terraform state file in s3
terraform {
    backend "s3" {
        bucket  = "agunigbo-terraform-remote-state"
        key     = "jupiter-website-ecs.tfstate"
        region  = "eu-west-2" 
        profile = "munachi"
    }
}