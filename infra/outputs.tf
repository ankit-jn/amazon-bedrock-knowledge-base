output "bucket_arn" {
  description = "The ARN of the bucket."
  value       = aws_s3_bucket.this.arn
}

output "oos_collection_arn" {
  description = "Amazon Resource Name (ARN) of the collection."
  value       = aws_opensearchserverless_collection.this.arn
}
output "oos_collection_endpoint" {
  description = "Collection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch Serverless collection."
  value       = aws_opensearchserverless_collection.this.collection_endpoint
}

output "fm_policy_arn" {
  description = "ARN of the Policy for defining permisions for accessing Foundation Model"
  value       = aws_iam_policy.fm_policy.arn
}

output "s3_policy_arn" {
  description = "ARN of the Policy to define permissions for accessing S3 bucket"
  value       = aws_iam_policy.s3_policy.arn
}

output "oss_policy_arn" {
  description = "ARN of the Policy to define permissions for OpenSearch Serverless"
  value       = aws_iam_policy.oss_policy.arn
}

output "bedrock_execution_role_arn" {
  description = "ARN of Bedrock Execution Role"
  value       = aws_iam_role.bedrock_execution_role.arn
}
