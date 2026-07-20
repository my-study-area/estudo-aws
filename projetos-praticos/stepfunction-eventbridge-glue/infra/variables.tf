variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "stepfunction-glue-eventbridge"
}

variable "environment" {
  description = "Ambiente (dev/stg/prd)"
  type        = string
  default     = "dev"
}
