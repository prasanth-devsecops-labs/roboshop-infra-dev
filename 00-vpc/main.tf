module "vpc" {
  source = "../../terraform-aws-vpc-module"
  project     = var.project_name
  environment = var.env
  is_peering_required = true
}