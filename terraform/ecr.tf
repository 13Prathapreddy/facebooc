variable "app_name" {
  default = "my-app"
}

resource "aws_ecr_repository" "app" {
  name = var.app_name
}

