# ECS

## cluster
module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 4.1.3"

  cluster_name = "fna-cluster"

  # * Allocate 20% capacity to FARGATE and then split
  # * the remaining 80% capacity 50/50 between FARGATE
  # * and FARGATE_SPOT.
  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        base   = 20
        weight = 50
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }
}

## task definition
resource "aws_ecs_task_definition" "fna-td" {
    container_definitions = jsonencode([{
      name  = "fna-td"
      image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.us-east-1.amazonaws.com/fargate-nodejs-app:latest" 
      portMappings = [{
        containerPort = 3000
        hostPort      = 3000
      }]
    }])

  cpu = 256
  execution_role_arn = resource.aws_iam_role.this.arn
  family = "family-of-fna-tasks"
  memory = 512
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
}

## ECS Service
resource "aws_ecs_service" "service-ecs" {
  cluster = module.ecs.cluster_arn
  desired_count = 2
  launch_type = "FARGATE"
  name = "fna-service"
  task_definition = aws_ecs_task_definition.fna-td.arn
  health_check_grace_period_seconds = 30

  lifecycle {
    ignore_changes = [desired_count] # Allow external changes to happen without Terraform conflicts, particularly around auto-scaling.
  }

  load_balancer {
    container_name = "fna-td"
    container_port = "3000"
    target_group_arn = module.alb.target_group_arns[0]
  }

  network_configuration {
    security_groups = [aws_security_group.fna-ecs-service-sg.id]
    subnets = [aws_subnet.fna-private-a.id, aws_subnet.fna-private-b.id]
    assign_public_ip = true
  }
}
