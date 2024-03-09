## S3 bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  force_destroy = var.bucket_force_destroy

  tags = merge({ "Name" = var.bucket_name }, var.default_tags)
}

resource "aws_opensearchserverless_collection" "this" {
  name        = var.oss_collection_name
  description = var.oss_collection_name
  type        = "VECTORSEARCH"
  tags        = merge({ "Name" = var.oss_collection_name }, var.default_tags)

  depends_on = [
    aws_opensearchserverless_security_policy.encryption,
    aws_opensearchserverless_security_policy.network,
    aws_opensearchserverless_access_policy.this
  ]
}
