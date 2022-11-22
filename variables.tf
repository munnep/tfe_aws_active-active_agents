variable "tag_prefix" {
  description = "default prefix of names"
}

variable "region" {
  description = "region to create the environment"
}

variable "vpc_cidr" {
  description = "which private subnet do you want to use for the VPC. Subnet mask of /16"
}

variable "ami" {
  description = "Must be an Ubuntu image that is available in the region you choose"
}

variable "dns_hostname" {
  type        = string
  description = "DNS name you use to access the website"
}

variable "dns_zonename" {
  type        = string
  description = "DNS zone the record should be created in"
}

variable "certificate_email" {
  type        = string
  description = "email adress that the certificate will be associated with on Let's Encrypt"
}

variable "tfe_agent_version" {
  type        = string
  description = "Terraform Cloud agent version to use. Semantic Versioning"
}

variable "filename_airgap" {
  description = "filename of your airgap installation located under directory airgap"
}

variable "filename_license" {
  description = "filename of your license located under directory airgap"
}

variable "filename_bootstrap" {
  description = "filename of your bootstrap located under directory airgap"
}

variable "rds_password" {
  description = "password for the RDS postgres database user"
}

variable "tfe_password" {
  description = "password for tfe user"
}

variable "asg_tfe_server_min_size" {
  description = "Autoscaling group minimal size TFE instance"
}

variable "asg_tfe_server_max_size" {
  description = "Autoscaling group maximal size  TFE instance"
}

variable "asg_tfe_server_desired_capacity" {
  description = "Autoscaling group running number of instances  TFE instance"
}

variable "asg_tfe_agent_min_size" {
  description = "Autoscaling group minimal size TFE agent"
}

variable "asg_tfe_agent_max_size" {
  description = "Autoscaling group maximal size TFE agent"
}

variable "asg_tfe_agent_desired_capacity" {
  description = "Autoscaling group running number of TFE agent"
}

variable "public_key" {
  type        = string
  description = "public to use on the instances"
}

variable "terraform_client_version" {
  description = "Terraform client installed on the terraform client machine"
}

variable "create_agents" {
  type        = bool
  description = "create the agents because TFE is available"
}
