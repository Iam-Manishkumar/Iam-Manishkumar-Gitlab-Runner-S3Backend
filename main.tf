data "aws_subnet" "terraform_subnet" {
  id = var.subnet
}

################################################################################################################
## Configure the user-data template file
################################################################################################################
data "template_file" "user_data" {
  template = templatefile("${path.module}/user-data.sh",
    { GITLAB_RUNNER_NAME         = var.gitlab_runner_name,
      GITLAB_RUNNER_URL          = var.gitlab_runner_url,
      GITLAB_RUNNER_TOKEN        = var.gitlab_runner_token,
      DOCKER_IMAGE_PATH          = var.gitlab_runner_docker_image,
      GITLAB_RUNNER_TAGS         = var.gitlab_runner_tags,
      GITLAB_RUNNER_DOCKER_IMAGE = var.gitlab_runner_docker_image,
      GITLAB_CONCURRENT_JOB      = var.gitlab_concurrent_job,
      GITLAB_CHECK_INTERVAL      = var.gitlab_check_interval
  })
}

resource "aws_iam_policy" "terraform_policy" {
  name        = "docu-tf-policy"
  description = "IAM policy for terraform Instance"
  policy      = data.aws_iam_policy_document.runner_iam_policy.json
}

resource "aws_iam_policy" "terraform_ssm_policy" {
  name        = "docu-ssm-policy"
  description = "IAM SSM policy for terraform Instance"
  policy      = data.aws_iam_policy_document.ssm_iam_policy.json
}

resource "aws_iam_role" "terraform_role" {
  name = "terraform-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "terraform_attach_policy" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = aws_iam_policy.terraform_policy.arn
}

resource "aws_iam_role_policy_attachment" "terraform_attach_ssm" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = aws_iam_policy.terraform_ssm_policy.arn
}

resource "aws_iam_instance_profile" "terraform_profile" {
  name = "terraform-instance-profile"
  role = aws_iam_role.terraform_role.name
}

resource "aws_security_group" "terraform_sg" {
  name   = "terrafor-sg"
  vpc_id = data.aws_subnet.terraform_subnet.vpc_id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "terraform_runner" {
  ami                    = var.amis.amazon
  instance_type          = var.flavor
  subnet_id              = var.subnet
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = {
    Name = "terraform-runner-v1"
  }
  iam_instance_profile = aws_iam_instance_profile.terraform_profile.name
  user_data            = data.template_file.user_data.rendered
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 30
  }
}

resource "aws_instance" "terraform_runner2" {
  ami                    = var.amis.amazon
  instance_type          = var.flavor
  subnet_id              = var.subnet
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = {
    Name = "terraform-runner-v2"
  }
  iam_instance_profile = aws_iam_instance_profile.terraform_profile.name
  user_data            = data.template_file.user_data.rendered
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 30
  }
}