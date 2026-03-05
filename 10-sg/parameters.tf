resource "aws_ssm_parameter" "sg_id" {
  for_each = var.security_groups
  name  = "/${var.project_name}/${var.env}/${each.key}_sg_id"
  type  = "String"
  value = module.sg[each.key].sg_id
}