## Assumable IAM Role
resource "aws_iam_role" "bedrock_execution_role" {

  name                  = var.bedrock_execution_role
  description           = "IAM Role used as Bedrock Execution Role"
  max_session_duration  = 3600
  path                  = "/"
  force_detach_policies = false
  assume_role_policy    = data.aws_iam_policy_document.bedrock_execution_role_policy.json

  tags = merge({ "Name" = var.bedrock_execution_role }, var.default_tags)
}

## Attachment of IAM role with the fm_policy
resource "aws_iam_role_policy_attachment" "fm_policy_attachment" {

  role       = var.bedrock_execution_role
  policy_arn = aws_iam_policy.fm_policy.arn

  depends_on = [
    aws_iam_role.bedrock_execution_role
  ]
}

## Attachment of IAM role with the s3_policy
resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {

  role       = var.bedrock_execution_role
  policy_arn = aws_iam_policy.s3_policy.arn

  depends_on = [
    aws_iam_role.bedrock_execution_role
  ]
}

## Attachment of IAM role with the oss_policy
resource "aws_iam_role_policy_attachment" "oss_policy_attachment" {

  role       = var.bedrock_execution_role
  policy_arn = aws_iam_policy.oss_policy.arn

  depends_on = [
    aws_iam_role.bedrock_execution_role
  ]
}
