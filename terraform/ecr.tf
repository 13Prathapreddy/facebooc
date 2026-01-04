#ECR Config File
variable "app_name" {
  default = "my-app"
}

resource "aws_ecr_repository" "app" {
  name = var.app_name

  image_tag_mutability = "MUTABLE"

  lifecycle {
    prevent_destroy = false
  }
}


