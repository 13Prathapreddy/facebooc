variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "my-app"
}

variable "image_tag" {
  description = "Docker image tag from GitHub Actions"
  type        = string
  default     = "latest"
}

