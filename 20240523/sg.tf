resource "aws_security_group" "ec2" {
    name = "volodymyr-sg"
    description = "Allow all traffic"
    vpc_id = data.aws_vpc.default.id

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