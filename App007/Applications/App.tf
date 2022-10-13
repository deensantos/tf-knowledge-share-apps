module "ApplicationYo" {
  source     = "../Prod_Module"
  app_id     = "AppYo"
  ip         = ["10.0.1.40", "10.0.2.40", "10.0.3.60"]
  env        = "prod"
  department = "IT"
}
