resource "aws_s3_bucket" "log_bucket" {
  bucket = "redshift-logs-${random_id.id.hex}"
  force_destroy = true
}

resource "random_id" "id" {
  byte_length = 4
}
