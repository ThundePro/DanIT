variable "name" {
    description = "Instance name"
    type = string
    default = "Volodymyr"
}

variable "instance_type" {
    description = "Instance type"
    type = string
    default = "t3.micro"
}

variable "key_name" {
    description = "Key Pair Name"
    type = string
    default = "steamus500"
  
}

variable "key_path" {
    description = "Key Path"
    type = string
    default = "/home/kali/steamus500.pem"
}

variable "ansible" {
    description = "Ansible file name"
    type = string
    default = "main.ini"
  
}