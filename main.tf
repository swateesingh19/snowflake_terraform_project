terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
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
resource "snowflake_schema" "demo_schema" {
  database = "DEMO_DB"
  name    = "DEMO_SCHEMA"
  comment = "Schema for Snowflake Terraform demo"

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}
