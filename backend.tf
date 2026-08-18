terraform {
  backend "s3" {
    bucket = "tech603-steven-project-2"
    key = "production.tfstate"
    region = "eu-west-1"
    use_lockfile = true
  }
}