# security group alb
resource "aws_security_group" "fna-alb-sg" {
  name   = "fna-alb-sg"
  vpc_id = aws_vpc.fna-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
