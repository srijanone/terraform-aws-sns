###############################################
## This is SNS logging IAM roles and policies
###############################################

resource "aws_iam_role" "this" {
  count = var.create_delivery_status_logging ? 1 : 0
  name  = "DeliveryStatusloggingSNSRole"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
  tags = merge(
    {
      "Name" = "DeliveryStatusloggingSNSRole"
    },
    var.tags
  )
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_iam_role_policy_attachment" "deliver_status_logging_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSNSRole"
  role       = aws_iam_role.this[0].name
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_iam_role.this]
}