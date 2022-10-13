terraform {
  backend "s3" {
    bucket         = "tf-learnings"
    key            = "tf-states/App00YO/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf_backend"
  }
}
