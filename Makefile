# Define the directories
VPC = 00-vpc
SG  = 10-sg
SGR = 20-sg-rules
BASTION = 30-bastion
DB  = 40-databases
BACKEND-ALB = 50-backend-alb
COMPONENTS = 90-components
FRONTEND-ALB = 80-frontend-alb
ACM = 70-acm
CDN = 95-cdn
OPENVPN = 98-openvpn 

.PHONY: vpc sg sgr bastion db backend-alb acm frontend-alb components cdn openvpn apply-all

# 00 VPC
vpc:
	@echo "--- Processing VPC ---"
	cd $(VPC) && terraform init && terraform apply -auto-approve

# 10 Security Groups
sg:
	@echo "--- Processing Security Groups ---"
	cd $(SG) && terraform init && terraform apply -auto-approve

# 20 SG Rules
sgr:
	@echo "--- Processing SG Rules ---"
	cd $(SGR) && terraform init && terraform apply -auto-approve

# 30 Bastion
bastion:
	@echo "--- Processing Bastion ---"
	cd $(BASTION) && terraform init && terraform apply -auto-approve

# 40 Databases
db:
	@echo "--- Processing Database ---"
	cd $(DB) && terraform init && terraform apply -auto-approve


# 50 Backend-ALB
backend-alb:
	@echo "--- Processing Backend-ALB ---"
	cd $(BACKEND-ALB) && terraform init && terraform apply -auto-approve


# 70 acm
acm:
	@echo "--- Processing ACM ---"
	cd $(ACM) && terraform init && terraform apply -auto-approve

# 80 Frontend-ALB
frontend-alb:
	@echo "--- Processing Frontend-ALB ---"
	cd $(FRONTEND-ALB) && terraform init && terraform apply -auto-approve

# 90 Components
components:
	@echo "--- Processing Components ---"
	cd $(COMPONENTS) && terraform init && terraform apply -auto-approve

# 95 cdn
cdn:
	@echo "--- Processing CDN ---"
	cd $(CDN) && terraform init && terraform apply -auto-approve

# 98 Openvpn
openvpn:
	@echo "--- Processing CDN ---"
	cd $(OPENVPN) && terraform init && terraform apply -auto-approve


# Run them all in order if you're in a hurry
apply-all: vpc sg sgr bastion db backend-alb acm frontend-alb components cdn openvpn


.PHONY: destroy-openvpn destroy-cdn destroy-components destroy-frontend-alb destroy-acm destroy-backend-alb destroy-db destroy-bastion destroy-sgr destroy-sg destroy-vpc destroy-all

# 98 OpenVPN
destroy-openvpn:
	cd $(OPENVPN) && terraform destroy -auto-approve

# 95 CDN
destroy-cdn:
	cd $(CDN) && terraform destroy -auto-approve

# 90 Components (Apps)
destroy-components:
	cd $(COMPONENTS) && terraform destroy -auto-approve

# 80 Frontend ALB
destroy-frontend-alb:
	cd $(FRONTEND-ALB) && terraform destroy -auto-approve

# 70 ACM
destroy-acm:
	cd $(ACM) && terraform destroy -auto-approve

# 50 Backend ALB
destroy-backend-alb:
	cd $(BACKEND-ALB) && terraform destroy -auto-approve

# 40 Databases
destroy-db:
	cd $(DB) && terraform destroy -auto-approve

# 30 Bastion
destroy-bastion:
	cd $(BASTION) && terraform destroy -auto-approve

# 20 SG Rules
destroy-sgr:
	cd $(SGR) && terraform destroy -auto-approve

# 10 Security Groups
destroy-sg:
	cd $(SG) && terraform destroy -auto-approve

# 00 VPC
destroy-vpc:
	cd $(VPC) && terraform destroy -auto-approve

# Full Cleanup in correct reverse order
destroy-all: destroy-openvpn destroy-cdn destroy-components destroy-frontend-alb destroy-acm destroy-backend-alb destroy-db destroy-bastion destroy-sgr destroy-sg destroy-vpc

