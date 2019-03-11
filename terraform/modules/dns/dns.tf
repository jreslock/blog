resource "aws_route53_zone" "primary-public" {
  name = "${var.domain}"

  tags {
    Name   = "${var.domain}"
    Source = "terraform"
  }
}

resource "aws_route53_record" "primary-ns" {
  zone_id = "${aws_route53_zone.primary-public.zone_id}"
  name    = "${aws_route53_zone.primary-public.name}"
  type    = "NS"
  ttl     = "300"

  records = [
    "${aws_route53_zone.primary-public.name_servers.0}",
    "${aws_route53_zone.primary-public.name_servers.1}",
    "${aws_route53_zone.primary-public.name_servers.2}",
    "${aws_route53_zone.primary-public.name_servers.3}",
  ]
}
