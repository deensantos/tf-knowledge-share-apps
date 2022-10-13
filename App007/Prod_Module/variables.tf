variable "app_id" {
type = string
description = "Application id"
}

variable "env" {
  type = string
  description = "Env Variable"
  default = null
}

variable "region" {
  type = string
  description = "region"
  default = "us-east-1"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}

variable "department" {
  type = string
  description = "Department"
}

variable "az" {
  type = list
  description = "AZ for application"
  default = ["a", "b", "a", "a", "b"]
}

variable "ip" {
  type = list
  description = "Instance IP's"
}