data "terraform_remote_state" "ssh" {
  backend = "remote"

  config = {
    organization = "Hashicorp-neh-Demo"

    workspaces = {
      name = "azure-demo-resourcegroup-${var.az_env}"
    } 
  }
}

resource "null_resource" "ssh_agent" {
  triggers = {
    always_run = timestamp() 
  }

  provisioner "local_exec" {
    command = <<EOT
      echo data.terraform_remote_state.ssh.outputs.ssh_private_key > ~/.ssh/id_rsa
      chmod 0600 ~/.ssh/id_rsa
      ssh-add ~/.ssh/id_rsa
    EOT
  }

}