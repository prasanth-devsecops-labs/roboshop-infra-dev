module "sg" {
  for_each = var.security_groups
  source = "../../terraform-aws-sg"
  project = var.project_name
  environment = var.env
  sg_name = replace(each.key, "_", "-")
  vpc_id = local.vpc_id
}