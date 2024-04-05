provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias      = "east"
  region     = "us-east-1"
  sts_region = "eu-west-1"
}
