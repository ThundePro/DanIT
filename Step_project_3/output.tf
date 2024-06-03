output "first_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.first_ec2.public_ip
}

output "second_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.secon_ec2.public_ip
}

output "three_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.three_ec2.public_ip
}

output "load_balancer" {
    description = "Load balancer dns"
    value = aws_elb.web_elb.dns_name
  
}

resource "local_file" "inventory" {
    filename = "${path.module}/ansible/inventories/${var.ansible_file_name}"
    content = <<-EOT
    all:
      vars:
        ansible_ssh_user: ${var.ansible_ssh_user}
        ansible_ssh_private_key_file: ${var.key_path}
      children:
        observer:
          hosts:
            padok-observer:
              ansible_host: ${aws_instance.first_ec2.public_ip}
        target:
          hosts:
            padok-observer:
              ansible_host: ${aws_instance.first_ec2.public_ip}
            padok-target-1:
              ansible_host: ${aws_instance.secon_ec2.public_ip}
            padok-target-2:
              ansible_host: ${aws_instance.three_ec2.public_ip}
    EOT
}

# resource "null_resource" "start_ansible" {
#     triggers = {
#         always_run = "${timestamp()}"
#     }

#     provisioner "local-exec" {
#         command = "ansible-playbook -i ansible/inventories/${var.ansible_file_name} ansible/playbooks/monitoring.yml"
#     }

#     depends_on = [ 
#         aws_instance.secon_ec2,
#         aws_instance.first_ec2,
#	  aws_instance.three_ec2
#      ]
# }
