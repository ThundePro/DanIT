resource "aws_security_group" "ec2" {
    name = "volodymyr-sg"
    description = "Allow all trafik"
    vpc_id = aws_vpc.main.id

    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }


    tags = local.tags
}