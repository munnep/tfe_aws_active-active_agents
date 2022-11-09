data "aws_iam_policy_document" "secretsmanager" {
  statement {
    actions   = ["secretsmanager:GetSecretValue","secretsmanager:UpdateSecret"]
    effect    = "Allow"
    resources = [aws_secretsmanager_secret_version.agent_token.secret_id]
    sid       = "AllowSecretsManagerSecretAccess"
  }
}

resource "aws_iam_role_policy" "secretsmanager" {
  policy = data.aws_iam_policy_document.secretsmanager.json
  role   = aws_iam_role.role.id
  name   = "${var.tag_prefix}-tfe-secretsmanager"
}

resource "aws_secretsmanager_secret" "agent_token" {
  description = "TFC agent token"
  name        = "${var.tag_prefix}-agent_token"
}

resource "aws_secretsmanager_secret_version" "agent_token" {
  secret_string = "not_set_yet"
  secret_id     = aws_secretsmanager_secret.agent_token.id
}

resource "aws_secretsmanager_secret" "admin_token" {
  description = "TFC agent token"
  name        = "${var.tag_prefix}-admin_token"
}

resource "aws_secretsmanager_secret_version" "admin_token" {
  secret_string = "not_set_yet"
  secret_id     = aws_secretsmanager_secret.admin_token.id
}

# output "secret_id" {
#   value = aws_secretsmanager_secret.agent_token.id
# }


