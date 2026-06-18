output "vpc_id" {
  value = aws_vpc.main.id
}

output "db_endpoint" {
  value = aws_db_instance.shipments.address
}

output "exports_bucket" {
  value = aws_s3_bucket.exports.bucket
}
