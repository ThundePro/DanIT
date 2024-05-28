output "first_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.first_ec2.public_ip
}

output "second_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.secon_ec2.public_ip
}

output "nginx_port" {
    description = "Custom Nginx port"
    value = var.nginx_port
}

output "nginx_body" {
    description = "Custom Nginx body"
    value = var.nginx_body
}

resource "local_file" "inventory" {
    filename = "${path.module}/inventory/${var.ansible}"
    content = <<-EOT
    [test]
    ${aws_instance.first_ec2.public_ip} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=${var.key_path}
    ${aws_instance.secon_ec2.public_ip} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=${var.key_path}

    [all:vars]
    nginx_port=${var.nginx_port}
    nginx_body=${var.nginx_body}
    EOT
}

resource "null_resource" "start_ansible" {
    triggers = {
        always_run = "${timestamp()}"
    }

    provisioner "local-exec" {
        command = "ansible-playbook -i inventory/main.ini playbooks/mybook.yaml"
    }

    depends_on = [ 
        aws_instance.secon_ec2,
        aws_instance.first_ec2
     ]
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
