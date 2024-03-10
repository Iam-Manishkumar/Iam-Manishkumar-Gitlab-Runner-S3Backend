terraform {
  backend "s3" {
    bucket  = "manishs3tf"
    encrypt = true
    key     = "tfstaterunner/tf"
    region  = "eu-west-1"
    profile = "thesis"
  }
}