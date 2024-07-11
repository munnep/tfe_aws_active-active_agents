output "ssh_tf_client" {
  value = "ssh ubuntu@${var.dns_hostname}-client.${var.dns_zonename}"
}

output "tfe_appplication" {
  value = "https://${var.dns_hostname}.${var.dns_zonename}"
}

data "aws_instances" "foo" {
  instance_tags = {
    "Name" = "${var.tag_prefix}-tfe-asg"
  }
  instance_state_names = ["running"]
}

output "ssh_tfe_server" {
  value = [
    for k in data.aws_instances.foo.private_ips : "ssh -J ubuntu@${var.dns_hostname}-client.${var.dns_zonename} ubuntu@${k}"
  ]
}

output "ssh_tfe_agent" {
  value = "ssh -J ubuntu@${var.dns_hostname}-client.${var.dns_zonename} ubuntu@<internal ip address of a TFE agent>"
}
