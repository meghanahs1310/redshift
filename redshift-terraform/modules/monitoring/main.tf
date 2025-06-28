resource "aws_cloudtrail" "trail" {
  name                          = "redshift-trail"
  s3_bucket_name                = var.log_bucket_id
  is_multi_region_trail         = true
  enable_logging                = true
}

resource "aws_cloudwatch_log_group" "redshift" {
  name = "/aws/redshift/queries"
}
