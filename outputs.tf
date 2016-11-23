output "bastion_fqdn" {
  value = "${aws_route53_record.route53_record.fqdn}"
}

output "bastion_instance_id" {
  value = "${aws_instance.instance.private_ip}"
}

output "bastion_private_ip" {
  value = "${aws_instance.instance.private_ip}"
}

output "bastion_public_ip" {
  value = "${aws_instance.instance.public_ip}"
}
