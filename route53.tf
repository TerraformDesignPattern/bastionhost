resource "aws_route53_record" "route53_record" {
  zone_id = "${data.terraform_remote_state.account.primary_zone_id}"
  name    = "${var.hostname}.${data.terraform_remote_state.account.domain_name}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.instance.public_ip}"]
}
