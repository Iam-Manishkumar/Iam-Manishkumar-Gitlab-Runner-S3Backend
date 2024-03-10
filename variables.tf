variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "flavor" {
  type    = string
  default = "t2.medium"
}

variable "amis" {
  type = map(any)
  default = {
    "amazon" = "ami-0d2a4a5d69e46ea0b"
  }
}

variable "subnet" {
  type    = string
  default = "subnet-010cf1202660fcdb4 "
}

################################################################################################################
## Gitlab Runner Settings
################################################################################################################
variable "gitlab_runner_name" {
  type        = string
  description = "Gitlab Runner Instance Name."
  default     = "Terraform-runner"
}
variable "gitlab_runner_url" {
  type        = string
  description = "Gitlab CI coordinator URL."
  default     = "https://gitlab.collaborationlayer-traton.com/"
}
variable "gitlab_runner_token" {
  type        = string
  description = "Gitlab Runner registration token."
  default     = "glrt-JxXHPkN8yGwfJr-PDBBy"
}
variable "gitlab_runner_tags" {
  type        = string
  description = "Gitlab Runner tag list (comma separated)."
  default     = "terraform"
}
variable "gitlab_runner_docker_image" {
  type        = string
  description = "Gitlab Runner default docker image."
  default     = "ubuntu:latest"
}
variable "gitlab_concurrent_job" {
  type        = string
  description = "Number of Gitlab CI concurent job to run."
  default     = "5"
}
variable "gitlab_check_interval" {
  type        = string
  description = "Gitlab CI check interval value."
  default     = "0"
}
