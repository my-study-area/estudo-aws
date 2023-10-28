# LOAD BALANCER
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.4.0"
  name = "fna-alb"
  load_balancer_type = "application"
  create_security_group = false
  security_groups    = [aws_security_group.fna-alb-sg.id]
  subnets = [aws_subnet.fna-public-a.id, aws_subnet.fna-public-b.id]
  vpc_id  = aws_vpc.fna-vpc.id

  http_tcp_listeners = [
    {
      # ! Defaults to "forward" action for "target group"
      # ! at index = 0 in "the target_groups" input below.
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  target_groups = [
    {
      name = "fna-tg"
      backend_port     = "80"
      backend_protocol = "HTTP"
      target_type      = "ip"
      health_check = {
        healthy_threshold   = 5
        unhealthy_threshold = 2
        path                = "/healthcheck"
        matcher             = "200,204"
      }
    }
  ]
}
