variable "aws_region" {
  type = string
  description = "AWS region of deployment"
  default = "us-east-1"
}

variable "app_id" {
    type = string
    description = "Application Id"
}

variable "env" {
  type = string
  description = "Environment"
}

variable "jump_server_ip" {
    type = list(string)
    description = "List of Jump server IPs"
    default = ["10.2.100.90/32"]
  
}

variable "subnet_type" {
    type = string
    description = "Type of subnet e.g application, data, public"
}

variable "az" {
    type = list(string)
    description = "AWS availability zone"
    default = ["a", "b", "a"]
}

az=[]

variable "az_alb" {
    type = list(string)
    description = "AWS availability zone"
    default = ["a", "b"]
}