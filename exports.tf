# Customer-facing CSV exports, linked from the dashboard's "Download report" button.
resource "aws_s3_bucket" "exports" {
  bucket = "halden-${var.environment}-report-exports"
}

resource "aws_s3_bucket_ownership_controls" "exports" {
  bucket = aws_s3_bucket.exports.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "exports" {
  depends_on = [aws_s3_bucket_ownership_controls.exports]
  bucket     = aws_s3_bucket.exports.id
  acl        = "public-read"
}

resource "aws_s3_bucket_lifecycle_configuration" "exports" {
  bucket = aws_s3_bucket.exports.id
  rule {
    id     = "expire-exports"
    status = "Enabled"
    filter {}
    expiration {
      days = 30
    }
  }
}
