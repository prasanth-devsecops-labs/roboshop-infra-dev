variable "project_name" {
  default = "roboshop"
  type    = string
}

variable "env" {
  default = "dev"
  type    = string
}

variable "security_groups" {
  type = map
  default = {
    # Databases
     "mongodb" = { description = "SG for MongoDB" }
     "redis" = { description = "SG for redis" }
     "mysql" = { description = "SG for mysql" }
     "rabbitmq" = { description = "SG for rabbitmq" }
     # Backend
     "catalogue" = { description = "SG for catalogue" }
     "user" = { description = "SG for user" }
     "cart" = { description = "SG for cart" }
     "shipping" = { description = "SG for shipping" }
     "payment" = { description = "SG for payment" }
     # Backend ALB
     "backend_alb" = { description = "SG for backend_alb" }
     # Frontend
     "frontend" = { description = "SG for frontend" }
     # Frontend ALB
     "frontend_alb" = { description = "SG for frontend_alb" }
     # Bastion
     "bastion" = { description = "SG for bastion" }
  }
  
}