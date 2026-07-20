resource "aws_scheduler_schedule_group" "glue_group" {
  name = "${var.project_name}-scheduler-group"

  tags = {
    Name        = "${var.project_name}-scheduler-group"
    Environment = var.environment
  }
}

resource "aws_scheduler_schedule" "every_5_minutes" {
  name = "${var.project_name}-schedule"

  flexible_time_window {
    mode = "OFF"
  }

  group_name = aws_scheduler_schedule_group.glue_group.name

  schedule_expression = "rate(5 minutes)"

  target {
    arn      = aws_sfn_state_machine.glue_orchestrator.arn
    role_arn = aws_iam_role.scheduler_role.arn

    input = jsonencode({
      GlueJobName = aws_glue_job.simple_job.name
    })

    retry_policy {
      maximum_event_age_in_seconds = 60
      maximum_retry_attempts       = 3
    }
  }

  kms_key_arn = aws_kms_key.scheduler_kms.arn
}
