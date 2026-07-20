resource "aws_sfn_state_machine" "glue_orchestrator" {
  name     = "${var.project_name}-orchestrator"
  role_arn = aws_iam_role.sfn_role.arn

  definition = jsonencode({
    Comment = "Executa Glue Job de forma orquestrada"
    StartAt = "RunGlueJob"
    States = {
      RunGlueJob = {
        Type = "Task"
        Resource = "arn:aws:states:::glue:startJobRun.sync"
        Parameters = {
          JobName = aws_glue_job.simple_job.name
          Arguments = {
            "--job-language" = "python"
          }
        }
        Next = "Success"
      }
      Success = {
        Type = "Succeed"
      }
    }
  })

  tags = {
    Name        = "${var.project_name}-orchestrator"
    Environment = var.environment
  }
}
