variable "model_id" {
  description = "Foundation Model ID"
  type        = string
  default     = "amazon.titan-embed-text-v1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "arjstack-kb-data-source"
}

variable "bucket_force_destroy" {
  description = <<EOF
Flag to decide if all objects (including any locked objects) should be 
deleted from the bucket so that the bucket can be destroyed without error
EOF
  type        = bool
  default     = false
}

variable "oss_collection_name" {
  description = "Name of the Openserach Server Collection"
  type        = string
  default     = "kb-oss"
}

variable "fm_policy_name" {
  description = "Name of the Policy for defining permisions for accessing Foundation Model"
  type        = string
  default     = "kb-policy-bedrock-foundation-model"
}

variable "s3_policy_name" {
  description = "Name of the Policy for defining permisions for accessing S3 Bucket"
  type        = string
  default     = "kb-policy-datasource-bucket"
}

variable "oss_policy_name" {
  description = "Name of the Policy for defining permisions for OpenSearch serverless"
  type        = string
  default     = "kb-policy-opensearch-serverless"
}

variable "bedrock_execution_role" {
  description = "Name of the IAM Role that will be used as Bedrock Execution Role"
  type        = string
  default     = "kb-role-bedrock-execution"
}

variable "default_tags" {
  description = "(Optional) A map of tags to assign to all resources."
  type        = map(any)
  default = {
    "Purpose" : "POC"
  }
}