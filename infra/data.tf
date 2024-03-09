data "aws_region" "current" {}
data "aws_caller_identity" "this" {}

## FM Policy Document
data "aws_iam_policy_document" "fm_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "bedrock:InvokeModel"
    ]

    resources = [
      "arn:aws:bedrock:${data.aws_region.current.id}::foundation-model/${var.model_id}"
    ]
  }
}

## S3 Policy Document
data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "aws:ResourceAccount"
      values   = [data.aws_caller_identity.this.account_id]
    }
  }
  depends_on = [aws_s3_bucket.this]
}

## OSS Policy Document
data "aws_iam_policy_document" "oss_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "aoss:APIAccessAll"
    ]

    resources = [
      aws_opensearchserverless_collection.this.arn
    ]
  }
  depends_on = [aws_opensearchserverless_collection.this]
}

## Assume Role Policy Document
data "aws_iam_policy_document" "bedrock_execution_role_policy" {

  statement {
    principals {
      identifiers = [
        "bedrock.amazonaws.com"
      ]
      type = "Service"
    }

    actions = [
      "sts:AssumeRole"
    ]

    effect = "Allow"
  }
}
