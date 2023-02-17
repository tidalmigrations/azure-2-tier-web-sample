# This file allows you to override the default values for the Terraform
# Best practices for this file are to keep this to only the values that 
# deviate from the defaults across the environments.
# For example, if dev & prod use different resource sizes, use these variable 
# files to customize that paramater

location = "canadacentral"
environment = "prod"
sql_admin_password = "myPR0Dp@ssword"
