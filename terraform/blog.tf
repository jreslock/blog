locals {
  domain = "${var.domain}"
}

module "dns" {
  source = "modules/dns"
  domain = "${var.domain}"
}

module "cert" {
  source = "modules/cert/"
  domain = "${local.domain}"
  zone_id = "${module.dns.zone_id}"
}


module "cloudfront" {
  source = "modules/cloudfront"
  domain = "${local.domain}"
}

module "s3" {
  source = "modules/s3"
  domain = "${local.domain}"
}