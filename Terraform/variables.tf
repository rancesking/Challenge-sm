variable "aws_region" {
  type        = string
  description = "The region in which to create/manage resources"
  default     = "us-east-1"
}

variable "env" {
  description = "Enviroment of the deployment"
  default = "dev"
}

variable "cli_user" {
  description = "The CLI user owner of the resource created."
  default     = "racosta"
}

variable "instance_type" {
  description = "The instance type of the worker node in the eks cluster."
  default     = "medium"
}

variable "service" {
  description = "The CLI service running in this module."
  default     = "EKS"
}
