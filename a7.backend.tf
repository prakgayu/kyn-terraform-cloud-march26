terraform {
  backend "s3" {
    bucket = "prakasam-s3-buket"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "prakasam-dynamodb"
    encrypt = true
  }
}