resource "aws_opensearchserverless_security_policy" "encryption" {
  name = "${var.oss_collection_name}-encryption-sec-policy"
  type = "encryption"
  policy = jsonencode({
    "Rules" = [
      {
        "Resource" = [
          "collection/${var.oss_collection_name}"
        ],
        "ResourceType" = "collection"
      }
    ],
    "AWSOwnedKey" = true
  })
}


resource "aws_opensearchserverless_security_policy" "network" {
  name = "${var.oss_collection_name}-network-sec-policy"
  type = "network"
  policy = jsonencode([
    {
      "Rules" = [
        {
          "Resource" = [
            "collection/${var.oss_collection_name}"
          ],
          "ResourceType" = "collection"
        }
      ],
      "AllowFromPublic" = true
    }
  ])
}

resource "aws_opensearchserverless_access_policy" "this" {
  name        = "${var.oss_collection_name}-data-access-policy"
  type        = "data"
  description = "Read and Write permissions"
  policy = jsonencode([
    {
      Rules = [
        {
          ResourceType = "index",
          Resource = [
            "index/${var.oss_collection_name}/*"
          ],
          Permission = [
            "aoss:CreateIndex",
            "aoss:DeleteIndex",
            "aoss:UpdateIndex",
            "aoss:DescribeIndex",
            "aoss:ReadDocument",
            "aoss:WriteDocument"
          ]
        },
        {
          ResourceType = "collection",
          Resource = [
            "collection/${var.oss_collection_name}"
          ],
          Permission = [
            "aoss:CreateCollectionItems",
            "aoss:DeleteCollectionItems",
            "aoss:UpdateCollectionItems",
            "aoss:DescribeCollectionItems"
          ]
        }
      ],
      Principal = [
        "arn:aws:iam::${data.aws_caller_identity.this.account_id}:root",
        data.aws_caller_identity.this.arn,
        aws_iam_role.bedrock_execution_role.arn
      ]
    }
  ])

  depends_on = [aws_iam_role.bedrock_execution_role]
}

