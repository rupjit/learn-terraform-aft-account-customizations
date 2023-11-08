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