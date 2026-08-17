terraform {
  backend "s3" {
    bucket = "tech603-steven-project-2"
    key = "production.tfstate"
    region = var.region
    use_lockfile = true
  }
}