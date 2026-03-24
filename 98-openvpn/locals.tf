locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = true
  }

  openvpn_final_tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-openvpn"
    }
  )

  ami_id = data.aws_ami.openvpn.id
  # public subnet in 1a availabilty zone
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
  openvpn_sg_id = data.aws_ssm_parameter.openvpn_sg_id.value
}