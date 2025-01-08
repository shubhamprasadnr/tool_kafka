resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr #"10.0.0.0/16"
  instance_tenancy = var.vpc_tenancy #"default"

  tags = {
    Name = var.vpc_tag_name # "my_vpc"
  }
}

resource "aws_subnet" "public_subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pub_subnet1_cidr #"10.0.0.0/27"
  availability_zone = var.pub_az1 #"us-east-1a"
  tags = {
    Name = var.pub_subnet1_tag #"public_subnet-1"
  }
}

resource "aws_subnet" "public_subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pub_subnet2_cidr #"10.0.0.32/27"
  availability_zone = var.pub_az2 #"us-east-1b"
  tags = {
    Name = var.pub_subnet2_tag #"public_subnet-2"
  }
}

resource "aws_subnet" "private_subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.priv_subnet1_cidr #"10.0.0.64/27"
  availability_zone = var.priv_az1 #"us-east-1a"
  tags = {
    Name = var.priv_subnet1_tag #"private_subnet-1"
  }
}

resource "aws_subnet" "private_subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.priv_subnet2_cidr #"10.0.0.96/27"
  availability_zone = var.priv_az2 #"us-east-1b"
  tags = {
    Name = var.priv_subnet2_tag #"private_subnet-2"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_tag_name #"IGW"
  }
}

resource "aws_route_table" "pubic_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }


  tags = {
    Name = "public_RT"
  }
}

resource "aws_eip" "nat-gateway-1" {
  domain   = "vpc"
  tags = {
    Name = "EIP-NAT-Gateway-1"
  }
}

resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.nat-gateway-1.id
  subnet_id     = aws_subnet.public_subnet-1.id

  tags = {
    Name = "NAT-gateway-1"
  }

  depends_on = [aws_internet_gateway.IGW]
}

resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-1.id
  }

  tags = {
    Name = "private_RT"
  }
}

resource "aws_route_table_association" "public_a1" {
  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.pubic_RT.id
}

resource "aws_route_table_association" "public_a2" {
  subnet_id      = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.pubic_RT.id
}

resource "aws_route_table_association" "private_a1" {
  subnet_id      = aws_subnet.private_subnet-1.id
  route_table_id = aws_route_table.private_RT.id
}

resource "aws_route_table_association" "private_a2" {
  subnet_id      = aws_subnet.private_subnet-2.id
  route_table_id = aws_route_table.private_RT.id
}


