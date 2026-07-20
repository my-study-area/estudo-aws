output "glue_job_arn" {
  description = "ARN do Glue Job"
  value       = aws_glue_job.simple_job.arn
}

output "step_function_arn" {
  description = "ARN da Step Function"
  value       = aws_sfn_state_machine.glue_orchestrator.arn
}

output "scheduler_arn" {
  description = "ARN do EventBridge Scheduler"
  value       = aws_scheduler_schedule.every_5_minutes.arn
}

output "kms_key_arn" {
  description = "ARN da chave KMS"
  value       = aws_kms_key.scheduler_kms.arn
}

output "glue_scripts_bucket" {
  description = "Bucket dos scripts Glue"
  value       = aws_s3_bucket.glue_scripts.bucket
}
