terraform {
    required_version = ">=0.12"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    backend "s3" {
        bucket         = "terraform-demo-backend-bucket"
        key            = "modulebackend.tfstate"
        region         = "us-east-1"
        encrypt        = true
        dynamodb_table = "tf-state-table"
  }
}
