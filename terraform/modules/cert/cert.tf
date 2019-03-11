# SSL certificate covering primary and secondary domains
resource "aws_acm_certificate" "cert" {
  domain_name       = "*.${var.domain}"
  validation_method = "DNS"

  tags {
    Name = "${var.domain}"
  }
}

resource "aws_route53_record" "primary_validation" {
  zone_id = "${var.zone_id}"
  name    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_acm_certificate.cert.domain_validation_options.0.resource_record_value}"]
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn = "${aws_acm_certificate.cert.arn}"

  validation_record_fqdns = [
    "${aws_route53_record.primary_validation.fqdn}",
  ]
}
