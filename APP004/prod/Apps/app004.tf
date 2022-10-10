module "AP005" {
    source = "../"
    app_id = "AP005"
    env = "prod"
    aws_region = "us-east-1"
    nic_ips = ["10.0.1.100","10.0.2.100","10.0.3.100"]  
}

module "AP006" {
    source = "../"
    app_id = "AP006"
    env = "prod"
    aws_region = "us-east-1"
    nic_ips = ["10.0.2.210","10.0.2.200","10.0.3.200"]  
    az = ["b","b","a"]
    instance_type = "t2.medium"
}