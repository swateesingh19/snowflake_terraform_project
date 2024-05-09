terraform {
  required_providers {
    snowflake = {
      source  = "swateesingh19/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "Snowflake-Terraform-POC"

    workspaces {
      name = "GitHub-Actions-POC"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
