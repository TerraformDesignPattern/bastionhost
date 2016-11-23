# Bastion Host Module

This example _Service Module_ creates an SSH jumpbox. The EC2 instance is placed in the first public subnet from `data.terraform_remote_state.vpc.public_subnet_ids`.

## Example Usage

This service module should be used as an _Environment Service Modules_. For example, add the below files to the following directory: `enviroments/$ACCOUNT/$REGION/%VPC/$ENVIRONMENT/ssh-bastion`

__main.tf__

```
module "environment" {
  source = "../"
}

module "ami_image_id" {
  source = "git@github.com:TerraformDesignPattern/packer.git?ref=4ddd5d059c6f501c0a0bfb56b7ceec3c2515dcc0//terraform-ami-module"

  aws_region = "${module.environment.aws_region}"
}

module "bastion" {
  source = "../../../../../../bastion/"

  aws_account = "${module.environment.aws_account}"
  aws_region = "${module.environment.aws_region}"
  environment_name = "${module.environment.environment_name}"
  hostname = "${var.hostname}"
  image_id = "${module.ami_image_id.base_image_id}"
  vpc_name = "${module.environment.vpc_name}"
}
```

__outputs.tf__

The `bastion_private_ip` output can be used by other modules to only allow this IP SSH access to the host.

```
output "bastion_fqdn" {
  value = "${module.bastion.bastion_fqdn}"
}

output "bastion_private_ip" {
  value = "${module.bastion.bastion_private_ip}"
}
```

__variables.tf__

The only required variable is the `hostname` variable. This will be used to create a FQDN.

```
variable "hostname" {
  default = "prod-ssh-use1"
}
```

Other available variables and their defaults:

```
variable "associate_public_ip_address" {
  default = true
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_port" {
  default = "22"
}
```
