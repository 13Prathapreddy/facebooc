data "aws_vpc" "default" {
  default = true
}

# Only fetch public subnets for Fargate tasks
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "tag:aws-cdk:subnet-type"
    values = ["Public"]
  }
}

resource "aws_security_group" "ecs" {
  name   = "${var.app_name}-sg"
  vpc_id = data.aws_vpc.default.id

  # Allow incoming traffic to container port
  ingress {
    from_port   = 16000
    to_port     = 16000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-sg"
  }
}

