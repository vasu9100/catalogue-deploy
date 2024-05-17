backend "s3" {
    bucket         = "roboshop-terraform-state-bucket"
    key            = "terraforminfra/catalogue-dev.state"
    region         = "us-east-1"
    dynamodb_table = "api-lock-dev"

}