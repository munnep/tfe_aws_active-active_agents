data "aws_iam_policy_document" "secretsmanager" {
  statement {
    actions   = ["secretsmanager:GetSecretValue", "secretsmanager:UpdateSecret", "secretsmanager:CreateSecret", "secretsmanager:PutSecretValue"]
    effect    = "Allow"
    resources = [aws_secretsmanager_secret.agent_token_secret.id, aws_secretsmanager_secret.admin_token_secret.id]
    sid       = "AllowSecretsManagerSecretAccess"
  }
}

resource "random_string" "random_secret_name" {
  length  = 8
  special = false
}

resource "aws_iam_role_policy" "secretsmanager" {
  policy = data.aws_iam_policy_document.secretsmanager.json
  role   = aws_iam_role.role.id
  name   = "${var.tag_prefix}-tfe-secretsmanager"
}

resource "aws_secretsmanager_secret" "agent_token_secret" {
  description = "TFE agent token"
  name        = "${var.tag_prefix}_${random_string.random_secret_name.result}_agent_token"

  recovery_window_in_days = 0
}


resource "aws_secretsmanager_secret" "admin_token_secret" {
  description = "TFE admin token"
  name        = "${var.tag_prefix}_${random_string.random_secret_name.result}_admin_token"

  recovery_window_in_days = 0
}

