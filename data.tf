data "terraform_remote_state" "rg" {
  backend = "remote"

  config = {
    organization = "Nehrman-Demo"
    workspaces = {
      name = "azure-demo-resourcegroup-${var.az_env}"
    }
  }
}

