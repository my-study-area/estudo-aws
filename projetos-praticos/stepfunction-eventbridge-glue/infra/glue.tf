resource "aws_glue_catalog_database" "glue_db" {
  name = "${var.project_name}_db"

  tags = {
    Name        = "${var.project_name}_db"
    Environment = var.environment
  }
}

resource "aws_glue_job" "simple_job" {
  name         = "${var.project_name}-job"
  role_arn     = aws_iam_role.glue_role.arn
  glue_version = "4.0"
  max_retries  = 0
  timeout      = 10

  worker_type       = "G.1X"
  number_of_workers = 2

  command {
    name            = "glueetl"
    script_location = "s3://${aws_s3_bucket.glue_scripts.bucket}/glue_script.py"
    python_version  = "3"
  }

  default_arguments = {
    "--job-language"                     = "python"
    "--TempDir"                          = "s3://${aws_s3_bucket.glue_scripts.bucket}/tmp/"
    "--job-bookmark-option"              = "job-bookmark-enable"
    "--enable-metrics"                   = "true"
    "--enable-continuous-cloudwatch-log" = "true"
  }

  tags = {
    Name        = "${var.project_name}-job"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "glue_scripts" {
  bucket = "${var.project_name}-scripts-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "${var.project_name}-scripts"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "glue_scripts" {
  bucket = aws_s3_bucket.glue_scripts.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "glue_script" {
  bucket = aws_s3_bucket.glue_scripts.id
  key    = "glue_script.py"
  source = "${path.module}/glue_script.py"
}
