provider "aws" {
    alias  = "us-east-1"
    region = "us-east-1"
  
}

resource "aws_sns_topic" "topic-test1-east" {
    provider = aws.us-east-1
    name    = "topic-test1-east"
  
}