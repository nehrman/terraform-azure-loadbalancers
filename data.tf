data "terraform_remote_state" "ssh" {
  backend = "remote"

  config = {
    organization = "Hashicorp-neh-Demo"

    workspaces = {
      name = "azure-demo-resourcegroup-${var.az_env}"
    } 
  }
}
