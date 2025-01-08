module "networking_module" {
  source = "./Networking_Module"

  vpc_cidr     = var.vpc_cidr
  vpc_tag_name = var.vpc_tag_name
  vpc_tenancy  = var.vpc_tenancy
  igw_tag_name = var.igw_tag_name
  nat_tag_name = var.nat_tag_name

  # Public Subnets
  pub_az1          = var.pub_az1
  pub_az2          = var.pub_az2
  pub_subnet1_cidr = var.pub_subnet1_cidr
  pub_subnet2_cidr = var.pub_subnet2_cidr
  pub_subnet1_tag  = var.pub_subnet1_tag
  pub_subnet2_tag  = var.pub_subnet2_tag

  # Private Subnets
  priv_az1          = var.priv_az1
  priv_az2          = var.priv_az2
  priv_subnet1_cidr = var.priv_subnet1_cidr
  priv_subnet2_cidr = var.priv_subnet2_cidr
  priv_subnet1_tag  = var.priv_subnet1_tag
  priv_subnet2_tag  = var.priv_subnet2_tag
}

module "security_module" {
  source              = "./Security_Module"
  vpc_id              = module.networking_module.vpc_id
  public_subnet_id_1  = module.networking_module.public_subnet-1
  public_subnet_id_2  = module.networking_module.public_subnet-2
  private_subnet_id_1 = module.networking_module.private_subnet-1
  private_subnet_id_2 = module.networking_module.private_subnet-2

  #vpc_id = var.vpc_id
  pub_sg_name      = var.pub_sg_name
  public_sg_route  = var.public_sg_route
  priv_sg_name     = var.priv_sg_name
  private_sg_route = var.private_sg_route
}

module "compute_module" {
  source              = "./Compute_Module"
  public_subnet_id_1  = module.networking_module.public_subnet-1 # Assuming `public_subnet_ids` is an output from the Networking module.
  public_subnet_id_2  = module.networking_module.public_subnet-2
  private_subnet_id_1 = module.networking_module.private_subnet-1
  private_subnet_id_2 = module.networking_module.private_subnet-2 # Assuming `private_subnet_ids` is an output from the Networking module.
  instance_ami        = var.instance_ami
  instance_type       = var.instance_type
  public_sg_id        = module.security_module.public_SG
  private_sg_id       = module.security_module.private_SG
  public_tag-1         = var.public_tag-1
  private_tag-1        = var.private_tag-1
  private_tag-2       = var.private_tag-2 
  key_name            = var.key_name
}

module "alb_module" {
  source = "./ALB_Module"
  vpc_id = module.networking_module.vpc_id
  public_SG = module.security_module.public_SG
  public_subnet_id_1 = module.networking_module.public_subnet-1
  public_subnet_id_2 = module.networking_module.public_subnet-2
  priv_instance_1 = module.compute_module.priv_instance1
  priv_instance_2 = module.compute_module.priv_instance2
}

module "asg_module" {
  source              = "./ASG_Module"
  my_instance_id      = module.compute_module.priv_instance1
  key_name            = var.key_name
  security_group_id   = module.security_module.private_SG
  private_subnet_id_1 = module.networking_module.private_subnet-1
  private_subnet_id_2 = module.networking_module.private_subnet-2
  my_target_group     = module.alb_module.my_target_group
}

module "vpc_peering_module" {
  source                = "./VPC_Peering_Module"
  source_vpc_id         = module.networking_module.vpc_id
  target_vpc_id         = var.default_vpc_id
  peer_name             = var.peer_name
  source_cidr_block     = var.vpc_cidr
  target_cidr_block     = var.default_vpc_cidr
  source_route_table_id_public = module.networking_module.public_route_table_id
  source_route_table_id_private = module.networking_module.private_route_table_id
  target_route_table_id = var.default_route_table_id
}




# module "s3" {
#   source     = "./s3_module"

# }


