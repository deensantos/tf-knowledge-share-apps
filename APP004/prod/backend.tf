terraform {
  backend "s3" {
    bucket = "tf-learnings"
    key    = "tf-states/app004/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf_backend"
  }
}
