# Public Security Group
resource "aws_security_group" "public_SG" {
  name        = var.pub_sg_name
  description = "This is a public security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.pub_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_public" {
  security_group_id = aws_security_group.public_SG.id
  cidr_ipv4         = var.public_sg_route
  ip_protocol       = "-1"
  # from_port         = 22
  # ip_protocol       = "tcp"
  # to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "egress_public" {
  security_group_id = aws_security_group.public_SG.id
  cidr_ipv4         = var.public_sg_route
  ip_protocol       = "-1"
}


# Private Security group
resource "aws_security_group" "private_SG" {
  name        = var.priv_sg_name
  description = "This is a private security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.priv_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_private" {
  security_group_id = aws_security_group.private_SG.id
  cidr_ipv4         = var.private_sg_route
  ip_protocol       = "-1"
  # from_port         = 22
  # ip_protocol       = "tcp"
  # to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "egress_private" {
  security_group_id = aws_security_group.private_SG.id
  cidr_ipv4         = var.private_sg_route
  ip_protocol       = "-1"
}

# NACL provisioning

resource "aws_network_acl" "public_nacl" {
  vpc_id = var.vpc_id

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "public_nacl"
  }
}

resource "aws_network_acl" "private_nacl" {
  vpc_id = var.vpc_id

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "private_nacl"
  }
}

resource "aws_network_acl_association" "publc_nacl-a1" {
  subnet_id = var.public_subnet_id_1
  network_acl_id = aws_network_acl.public_nacl.id
  
}

resource "aws_network_acl_association" "publc_nacl-a2" {
  subnet_id = var.public_subnet_id_2
  network_acl_id = aws_network_acl.public_nacl.id
  
}

resource "aws_network_acl_association" "private_nacl-a1" {
  subnet_id = var.private_subnet_id_1
  network_acl_id = aws_network_acl.private_nacl.id
  
}

resource "aws_network_acl_association" "private_nacl-a2" {
  subnet_id = var.private_subnet_id_2
  network_acl_id = aws_network_acl.private_nacl.id
  
}
