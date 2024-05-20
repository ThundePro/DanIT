variable "instance_type" {
    description = "Instance type"
    type = string
    default = "t3.micro"
}

variable "name" {
    description = "Instance name"
    type = string
    default = "volodymyr"
}

variable "key_name" {
    description = "Key name"
    type = string
    default = "steamus500"
}
