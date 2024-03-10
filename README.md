# terraform-runner-bootstrap



## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

## Name
Repository for deploying a runner for running Terraform code.

## Description
This repo have the files for bootstraping a EC2 instance, register it as a Gitlab runner an be able to run terraform pipelines.

## Installation
Installation steps for deploying a new Terraform runner if no previous one exist.

1. Start your VM and open the terminal. Be sure you have installed Terraform and AWScli packages in your VM.
2. Clone this repo.
3. Login through AWS using the cli. For more info about how to login in AWS, see this [document](https://docs.cloud.scania.com/aws/identity-and-access-management/#ProgrammaticAccess)
4. On the VM, inside the repo folder, exec the command "Terraform init" for initialize all the terraform settings (providers).
5. Next, exec "terraform plan -out=runner.tfplan" for planning and see all the resources that are going to be created.
6. Finally, exec "terraform apply "runner.tfplan" " for apply all the config and start deploying infraestructure in AWS.
7. After all the process, a new file called `terraform.tfstate` should appear in your working directory. It´s important to save that file for be able to update or delete all the resources deployed. (Work in progress about how to handle this file)

## Usage
This repo consist of the following files:

- [ ] `main.tf` Used for the main part of the code, here is defined all the Terraform resources that are going to be created in AWS
- [ ] `variables.tf` File for defining all the variables needed and used in the main.tf file and in the user-data.sh script
- [ ] `iam_policy.tf` File for storing the IAM policies created for the Terraform instance
- [ ] `user-data.sh` Code for installing packages needed, like Docker and Gitlab-runner

Other files (Must be store in other location soon)
- [ ] `terraform.tfstate` Terraform control file for knowing what infraestructure have been deploy and what it´s new. IMPORTANT FILE
- [ ] `.terraform.lock.hcl` Lock file for have a control of all the new commits.

# Editing this README

When you're ready to make this README your own, just edit this file and use the handy template below (or feel free to structure it however you want - this is just a starting point!). Thank you to [makeareadme.com](https://www.makeareadme.com/) for this template.

## Suggestions for a good README
Every project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

## Support



## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
