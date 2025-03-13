provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_wafv2_web_acl" "blog_web_acl" {
  provider = aws.us_east_1
  name = "blog-web-acl"
  description = "Web ACL for my blog"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name = "ip-reputation"
    priority = 1

    statement {
      managed_rule_group_statement {
        name = "AWSManagedRulesIpReputationList"
        vendor_name = "AWS"
      }
    }

    action {
      block {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name = "ip-reputation-rule-blog"
      sampled_requests_enabled = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name = "blog-web-acl"
    sampled_requests_enabled = true
  }
}