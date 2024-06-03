module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Volodymyr-vpc-module"
  cidr = "10.0.0.0/16"

  azs             = ["eu-north-1a"]
  public_subnets  = ["10.0.101.0/24"]

  # enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Owner = "Volodymyr"
    CreatedBy = "Volodymyr"
    Purpose = "step3"
  }
}
# data "aws_vpc" "default" {
#     default = true
# }