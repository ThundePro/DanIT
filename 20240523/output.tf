output "first_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.first_ec2.public_ip
}

output "second_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.secon_ec2.public_ip
}

resource "local_file" "inventory" {
    filename = "${path.module}/inventory/${var.ansible}"
    content = <<-EOT
    [test]
    ${aws_instance.first_ec2.public_ip} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=${var.key_path}
    ${aws_instance.secon_ec2.public_ip} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=${var.key_path}
    EOT
}

# resource "null_resource" "ansible" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
#     working_dir = "${path.module}/../"
#     command = "ansible-playbook -i inventory/${var.ansible} playbooks/mybook.yaml"
#   }
# }
