ENV=terraform/environments/dev

tfi:
	cd $(ENV) && terraform init

tfp:
	cd $(ENV) && terraform plan

tfa:
	cd $(ENV) && terraform apply

tfd:
	cd $(ENV) && terraform destroy

fmt:
	terraform fmt -recursive

validate:
	cd $(ENV) && terraform validate

test:
	pytest tests/
