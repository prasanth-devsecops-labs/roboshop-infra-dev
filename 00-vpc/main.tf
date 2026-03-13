module "vpc" {
  # source = "../../terraform-aws-vpc-module"
  source = "git::https://github.com/prasanth-devsecops-labs/terraform-aws-vpc-module.git?ref=main"
  project     = var.project_name
  environment = var.env
  is_peering_required = true
}