resource "aws_iam_policy" "fm_policy" {
  name        = var.fm_policy_name
  description = "Policy to define permissions for accessing Foundation Model"
  path        = "/"

  policy = data.aws_iam_policy_document.fm_policy_document.json

  tags = merge({ "Name" = var.fm_policy_name }, var.default_tags)
}

resource "aws_iam_policy" "s3_policy" {
  name        = var.s3_policy_name
  description = "Policy to define permissions for accessing S3 bucket"
  path        = "/"

  policy = data.aws_iam_policy_document.s3_policy_document.json

  tags = merge({ "Name" = var.s3_policy_name }, var.default_tags)
}

resource "aws_iam_policy" "oss_policy" {
  name        = var.oss_policy_name
  description = "Policy to define permissions for OpenSearch Serverless"
  path        = "/"

  policy = data.aws_iam_policy_document.oss_policy_document.json

  tags = merge({ "Name" = var.oss_policy_name }, var.default_tags)
}
