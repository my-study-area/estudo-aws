resource "aws_kms_key" "scheduler_kms" {
  description             = "Chave KMS para criptografia do EventBridge Scheduler"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      },
      {
        Sid    = "AllowSchedulerRoleToUseKey"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.scheduler_role.arn
        }
        Action = [
          "kms:Decrypt",
          "kms:DescribeKey",
          "kms:GenerateDataKey*"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-kms"
    Environment = var.environment
  }
}

resource "aws_kms_alias" "scheduler_kms_alias" {
  name          = "alias/${var.project_name}-scheduler"
  target_key_id = aws_kms_key.scheduler_kms.key_id
}
