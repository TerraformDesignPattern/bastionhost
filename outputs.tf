output "fqdn" {
  value = "${aws_route53_record.route53_record.fqdn}"
}

output "instance_id" {
  value = "${aws_instance.instance.private_ip}"
}

output "private_ip" {
  value = "${aws_instance.instance.private_ip}"
}

output "public_ip" {
  value = "${aws_instance.instance.public_ip}"
}

output "security_group_id" {
  value = "${aws_security_group.security_group.id}"
}
