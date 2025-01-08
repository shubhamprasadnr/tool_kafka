resource "aws_instance" "pub_instance1" {
  ami           = var.instance_ami
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id_1
  security_groups = [var.public_sg_id]
  associate_public_ip_address = true
  key_name = var.key_name

  tags = {
    Name = var.public_tag-1
  }
}

resource "aws_instance" "priv_instance1" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id_1
  security_groups = [var.private_sg_id]
  user_data = file("./Compute_Module/nginx_install.sh")
  key_name = var.key_name
  tags = {
    Name = var.private_tag-1
  }
}

resource "aws_instance" "priv_instance2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id_2
  security_groups = [var.private_sg_id]
  user_data = file("./Compute_Module/nginx_install.sh")
  key_name = var.key_name
  tags = {
    Name = var.private_tag-2
  }
}