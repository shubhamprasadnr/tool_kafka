variable "vpc_id" {
  type = string
}

variable "pub_sg_name" {
  type = string
  #default = "public_SG"  
}

variable "public_sg_route" {
  type = string
  #default = "0.0.0.0/0"
}

variable "priv_sg_name" {
  type = string
  #default = "private_SG"  
}

variable "private_sg_route" {
  type = string
  #default = "0.0.0.0/0"
}

# for subnet association to NACL
variable "public_subnet_id_1" {
  type = string

}

variable "public_subnet_id_2" {
  type = string

}

variable "private_subnet_id_1" {
  type = string

}

variable "private_subnet_id_2" {
  type = string

}

# NACL variable

# variable "nacl_ingress_protocol" {
#   type = string
#   default = "-1"
# }

# variable "nacl_ingress_rule_no" {
#   type = string
#   default = 200
# }

# variable "nacl_ingress_action" {
#   type = string
#   default = ""
# }