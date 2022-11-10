data "aws_iam_policy_document" "secretsmanager" {
  statement {
    actions   = ["secretsmanager:GetSecretValue", "secretsmanager:UpdateSecret", "secretsmanager:CreateSecret", "secretsmanager:PutSecretValue"]
    effect    = "Allow"
    resources = [aws_secretsmanager_secret.agent_token_secret.id, aws_secretsmanager_secret.admin_token_secret.id]
    sid       = "AllowSecretsManagerSecretAccess"
  }
}

resource "aws_iam_role_policy" "secretsmanager" {
  policy = data.aws_iam_policy_document.secretsmanager.json
  role   = aws_iam_role.role.id
  name   = "${var.tag_prefix}-tfe-secretsmanager"
}

resource "aws_secretsmanager_secret" "agent_token_secret" {
  description = "TFE agent token"
  name        = "${var.tag_prefix}_agent_token3"

  recovery_window_in_days = 0
}


resource "aws_secretsmanager_secret" "admin_token_secret" {
  description = "TFE admin token"
  name        = "${var.tag_prefix}_admin_token3"

  recovery_window_in_days = 0
}

