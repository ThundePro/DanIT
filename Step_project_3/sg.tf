resource "aws_security_group" "ec2" {
    name = "volodymyr-sg"
    description = "Allow all traffic"
    # vpc_id = data.aws_vpc.default.id
    vpc_id = module.vpc.vpc_id

    # ingress {
    #     description = "Allow HTTP traffic"
    #     from_port   = var.nginx_port
    #     to_port     = var.nginx_port
    #     protocol    = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    # ingress {
    #     description = "Allow SSH traffic"
    #     from_port   = 22
    #     to_port     = 22
    #     protocol    = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}