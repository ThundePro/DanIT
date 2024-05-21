data "aws_ami" "al2" {
  most_recent = true

  filter {
    name = "owner-alias"
    values = [ "amazon" ]
  }

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm*" ]
  }
}

resource "aws_instance" "public_ec2" {
    ami = data.aws_ami.al2.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.ec2.id ]

    subnet_id = module.vpc.public_subnet_id

    associate_public_ip_address = true
    key_name = var.key_name

    tags = local.tags
}

resource "aws_instance" "private_ec2" {
    ami = data.aws_ami.al2.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.ec2.id ]

    subnet_id = module.vpc.private_subnet_id

    associate_public_ip_address = true
    key_name = var.key_name

    tags = local.tags
}