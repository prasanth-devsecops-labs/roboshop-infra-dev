locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = true
  }

  bastion_final_tags = merge(
    var.bastion_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-bastion"
    }
  )

  bastion_role_final_tags = merge(
    local.common_tags,
    {
        Name = var.bastion_role_name
    }
  )

  ami_id = data.aws_ami.devops.id
  # public subnet in 1a availabilty zone
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}