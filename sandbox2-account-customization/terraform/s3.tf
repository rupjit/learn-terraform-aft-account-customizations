data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "sandbox_bucket2" {
  bucket = "aft-sandbox-23432342${data.aws_caller_identity.current.account_id}"
  acl    = "private"
    tags = {
    Name        = "My_bucket2"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "sandbox_bucket3" {
  bucket = "aft-sandbox-23423423${data.aws_caller_identity.current.account_id}"
  acl    = "private"
    tags = {
    Name        = "My_bucket3"
    Environment = "Dev"
  }
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}