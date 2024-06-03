data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "first_ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    subnet_id = module.vpc.public_subnets[0]

    key_name = var.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.ec2.id ]

    user_data = file("${path.module}/scripts/user_data.sh")
}

resource "aws_instance" "secon_ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    subnet_id = module.vpc.public_subnets[0]

    key_name = var.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.ec2.id ]

    user_data = file("${path.module}/scripts/user_data.sh")
}

resource "aws_instance" "three_ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    subnet_id = module.vpc.public_subnets[0]

    key_name = var.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.ec2.id ]

    user_data = file("${path.module}/scripts/user_data.sh")
}