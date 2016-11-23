// Create EC2 Instance
resource "aws_instance" "instance" {
  ami = "${var.image_id}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  instance_type = "${var.instance_type}"
  key_name = "${data.terraform_remote_state.account.key_pair_name}"
  security_groups = ["${aws_security_group.security_group.name}"]
  subnet_id = "${element(data.terraform_remote_state.vpc.public_subnet_ids, 0)}"

  tags {
    Name = "${var.vpc_name}-bastion-${var.aws_region}"
  }
}
