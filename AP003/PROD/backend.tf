terraform {
  backend "s3"{
    bucket="tf-learnings"
    key="tf-states/tf-hands-on/AP003/terraform.tfstate"
    encrypt=true
    region="us-east-1"
    dynamodb_table = "tf_backend"
  }
}