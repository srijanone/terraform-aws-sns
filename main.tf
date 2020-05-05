resource "aws_sns_topic" "this" {
  count                                    = var.create_sns_topic ? 1 : 0
  name                                     = var.name
  display_name                             = var.display_name
  policy                                   = var.policy
  delivery_policy                          = var.delivery_policy
  application_success_feedback_role_arn    = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.application_success_feedback_sample_rate
  application_failure_feedback_role_arn    = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.application_failure_feedback_role_arn
  http_success_feedback_role_arn           = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.http_success_feedback_role_arn
  http_success_feedback_sample_rate        = var.http_success_feedback_sample_rate
  http_failure_feedback_role_arn           = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.http_failure_feedback_role_arn
  kms_master_key_id                        = var.kms_master_key_id
  lambda_success_feedback_role_arn         = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = var.lambda_success_feedback_sample_rate
  lambda_failure_feedback_role_arn         = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.lambda_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = var.sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn            = var.create_delivery_status_logging ? aws_iam_role.this[0].arn : var.sqs_failure_feedback_role_arn
  tags                                     = var.tags
}
