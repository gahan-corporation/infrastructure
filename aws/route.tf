data "aws_route53_zone" "gc" {
  name         = "gahan-corporation.com."
}

resource "aws_route53_record" "all" {
  zone_id = "${data.aws_route53_zone.gc.zone_id}"
  name    = "*.${data.aws_route53_zone.gc.name}"
  type    = "A"
  ttl     = "86400"
  records = ["34.213.189.167"]
}

resource "aws_route53_record" "bare" {
  zone_id = "${data.aws_route53_zone.gc.zone_id}"
  name    = "${data.aws_route53_zone.gc.name}"
  type    = "A"
  ttl     = "86400"
  records = ["34.213.189.167"]
}

resource "aws_route53_record" "dev" {
  zone_id = "${data.aws_route53_zone.gc.zone_id}"
  name = "dev.gahan-corporation.com"
  type = "A"
  ttl = "60"
  records = ["34.214.20.194"]
}

resource "aws_route53_record" "aspmx" {
  zone_id = "${data.aws_route53_zone.gc.zone_id}"
  name    = "${data.aws_route53_zone.gc.name}"
  type    = "MX"
  ttl     = "60"
  records = [
    "1 aspmx.l.google.com.",
    "5	alt1.aspmx.l.google.com.",
    "5	alt2.aspmx.l.google.com.",
    "10	alt3.aspmx.l.google.com.",
    "10	alt4.aspmx.l.google.com."
  ]
}
