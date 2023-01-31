resource "aws_cloudwatch_log_group" "this" {
  name              = "${local.stack}-${var.log_group_suffix}"
  kms_key_id        = var.kms_key_id
  retention_in_days = var.retention_in_days
  skip_destroy      = var.skip_destroy
}