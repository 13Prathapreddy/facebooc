variable "aws_region" {
  default = "us-east-1"
}

variable "app_name" {
  default = "my-app"
}

variable "image_tag" {
  description = "Docker image tag from GitHub Actions"
  default     = ""  # optional for first apply
}

variable "deploy_ecs_service" {
  description = "Whether to deploy ECS service"
  type        = bool
  default     = false
}

