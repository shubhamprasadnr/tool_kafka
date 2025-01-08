variable "vpc_cidr" {
  type = string
  #default = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  type = string
  #default = "default"
}

variable "vpc_tag_name" {
  type = string
  #default = "my_vpc"
}

variable "pub_subnet1_cidr" {
  type = string
  #default = "10.0.0.0/27"
}

variable "pub_az1" {
  type = string
  #default = "us-east-1a"
}

variable "pub_subnet1_tag" {
  type = string
  #default = "public_subnet-1"
}

variable "pub_subnet2_cidr" {
    type = string
    #default = "10.0.0.32/27"
  
}

variable "pub_az2" {
    type = string
    #default = "us-east-1b"

}

variable "pub_subnet2_tag" {
    type = string
    #default = "public_subnet-2"
  
}

variable "priv_subnet1_cidr" {
    type = string
    #default = "10.0.0.64/27"
  
}

variable "priv_az1" {
    type = string
    #default = "us-east-1a"  
}

variable "priv_subnet1_tag" {
  type = string
  #default = "private_subnet-1"
}

variable "priv_subnet2_cidr" {
    type = string
    #default = "10.0.0.96/27"
  
}

variable "priv_az2" {
    type = string
    #default = "us-east-1b"
}

variable "priv_subnet2_tag" {
  type = string
  #default = "private_subnet-2"
}

variable "igw_tag_name" {
  type = string
  #default = "IGW"
}

variable "nat_tag_name" {
  type = string
  #default = "NAT-gateway-1"
  
}