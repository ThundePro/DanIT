variable "name" {
    description = "Instance name"
    type = string
    default = "volodymyr"
}

variable "region" {
    description = "Region"
    type = string
    default = "eu-north-1"
}

variable "tags" {
    description = "Tags"
    type = map(string)
    default = {}
}

variable "vpc_cidr" {
    description = "VPC Cidr"
    type = string
    default = "10.0.0.0/16"
}

variable "private_subnet" {
    description = "Private subnet"
    type = string
    default = "10.0.1.0/24"
}

variable "public_subnet" {
    description = "Public subnet"
    type = string
    default = "10.0.2.0/24"

    validation {
        condition     = var.public_subnet != "0.0.0.0/0" && var.public_subnet != ""
        error_message = "Value cannot be '0.0.0.0/0' or an empty string."
    }
}