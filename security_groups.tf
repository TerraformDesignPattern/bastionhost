//Define Security Groups
resource "aws_security_group" "security_group" {
  name   = "${var.vpc_name}-bastion-${var.aws_region}"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  ingress {
    from_port   = "${var.ssh_port}"
    to_port     = "${var.ssh_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    name = "${var.vpc_name}-bastion-${var.aws_region}"
  }
}
