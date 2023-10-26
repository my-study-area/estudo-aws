# cria repositório no ecr
module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 1.6.0"

  repository_force_delete = true
  repository_name         = local.repository_name
  repository_lifecycle_policy = jsonencode({
    rules = [{
      action       = { type = "expire" }
      description  = "Delete all images except a handful of the newest images"
      rulePriority = 1
      selection = {
        countNumber = 3
        countType   = "imageCountMoreThan"
        tagStatus   = "any"
      }
    }]
  })
}

resource "aws_ecr_lifecycle_policy" "default_policy" {
  repository = local.repository_name

  policy = <<EOF
  {
      "rules": [
          {
              "rulePriority": 1,
              "description": "Imagem para kafka",
              "selection": {
                  "tagStatus": "untagged",
                  "countType": "imageCountMoreThan",
                  "countNumber": 1
              },
              "action": {
                  "type": "expire"
              }
          }
      ]
  }
  EOF
}

resource "null_resource" "docker_packaging" {

  provisioner "local-exec" {
    command = <<EOF
      aws ecr get-login-password --profile sandbox | docker login --username AWS --password-stdin "${data.aws_caller_identity.current.account_id}".dkr.ecr.us-east-1.amazonaws.com
      docker build -t fargate-nodejs-app -f app/Dockerfile .
      docker tag "${local.repository_name}":latest ${data.aws_caller_identity.current.account_id}.dkr.ecr.us-east-1.amazonaws.com/"${local.repository_name}":latest
      docker push "${data.aws_caller_identity.current.account_id}".dkr.ecr.us-east-1.amazonaws.com/"${local.repository_name}":latest
      EOF
  }

  triggers = {
    "run_at" = timestamp()
  }


  depends_on = [
    module.ecr
  ]
}
