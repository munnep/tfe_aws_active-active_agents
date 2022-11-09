
# 2 manual steps
# ssh -J ubuntu@patrick-tfe2-client.bg.hashicorp-success.com ubuntu@<internal ip address of a TFE server> /bin/bash /tmp/tfe_setup.sh

resource "null_resource" "configure_tfe" {
  provisioner "local-exec" {
    command = "ssh -o StrictHostKeyChecking=no -J ubuntu@${var.dns_hostname}-client.${var.dns_zonename} ubuntu@<internal ip address of a TFE server> /bin/bash /tmp/tfe_setup.sh"
  }
}

