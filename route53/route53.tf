variable "region" {
  default     = "eu-west-1"
  description = "AWS region"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = "eu-west-1"
}

data "aws_route53_zone" "inventiacloud_com" {
  name = "inventiacloud.com"
}


resource "aws_route53_record" "gitlab_address" {

  name = var.gitlab_domain
  type = "CNAME"
  ttl = 300
  records = [var.alb_adress]
  zone_id = data.aws_route53_zone.inventiacloud_com.zone_id


}
