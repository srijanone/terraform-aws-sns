resource "aws_sns_topic_policy" "default" {
  count = var.policy == null ? 0 : 1
  arn   = aws_sns_topic.this[0].arn

  policy     = var.policy
  depends_on = [aws_sns_topic.this]
}
