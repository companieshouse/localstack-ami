variable "ami_account_ids" {
  type        = list(string)
  description = "A list of account IDs that have access to launch the resulting AMI(s)"
}

variable "ami_name_prefix" {
  type        = string
  default     = "localstack"
  description = "The prefix string that will be used for the name tags of the resulting AMI and snapshot(s); the version string will be appended automatically"
}

variable "aws_instance_type" {
  type        = string
  default     = "t3.small"
  description = "The EC2 instance type used when building the AMI"
}

variable "aws_region" {
  type        = string
  default     = "eu-west-2"
  description = "The AWS region in which the AMI will be built"
}

variable "aws_source_ami_filter_name" {
  type        = string
  default     = "al2023-ami-2023.*-x86_64"
  description = "The source AMI filter string. Any filter described by the DescribeImages API documentation is valid. If multiple images match then the latest will be used"
}

variable "aws_source_ami_owner_id" {
  type        = string
  description = "The source AMI owner ID; used in combination with aws_source_ami_filter_name to filter for matching source AMIs"
}

variable "aws_subnet_filter_name" {
  type        = string
  description = "The subnet filter string. Any filter described by the DescribeSubnets API documentation is valid. If multiple subnets match then the one with the most IPv4 addresses free will be used"
}

variable "configuration_group" {
  type        = string
  default     = "localstack"
  description = "The name of the group to which to add the instance for configuration purposes"
}

variable "data_volume_iops" {
  type        = number
  default     = 3000
  description = "The baseline IOPS for the data EBS volume; 3000 is the gp3 default"
}

variable "data_volume_size_gib" {
  type        = number
  description = "The EC2 instance data volume size in Gibibytes (GiB)"
}

variable "data_volume_throughput" {
  type        = number
  default     = 125
  description = "The throughput, in MiB/s, for the data EBS volume; 125 is the gp3 default"
}

variable "force_delete_snapshot" {
  type        = bool
  default     = false
  description = "Delete snapshots associated with AMIs, which have been deregistered by force_deregister"
}

variable "force_deregister" {
  type        = bool
  default     = false
  description = "Deregister an existing AMI if one with the same name already exists"
}

variable "kms_key_id" {
  type        = string
  default     = "alias/packer-builders-kms"
  description = "The KMS key ID or alias to use when encrypting the AMI EBS volumes; defaults to the AWS managed key if empty"
}

variable "playbook_file_path" {
  type        = string
  default     = "../ansible/playbook.yml"
  description = "The relative path to the Ansible playbook file"
}

variable "root_volume_iops" {
  type        = number
  default     = 3000
  description = "The baseline IOPS for the root EBS volume; 3000 is the gp3 default"
}

variable "root_volume_size_gb" {
  type        = number
  default     = 20
  description = "The EC2 instance root volume size in Gibibytes (GiB)"
}

variable "root_volume_throughput" {
  type        = number
  default     = 125
  description = "The throughput, in MiB/s, for the root EBS volume; 125 is the gp3 default"
}

variable "ssh_clear_authorized_keys" {
  type        = bool
  default     = true
  description = "Defines whether the authorized_keys file should be cleared, post-build"
}

variable "ssh_private_key_file" {
  type        = string
  default     = "/home/packer/.ssh/packer-builder"
  description = "The path to the common Packer builder private SSH key"
}

variable "ssh_username" {
  type        = string
  default     = "ec2-user"
  description = "The username Packer will use when connecting with SSH"
}

variable "version" {
  type        = string
  description = "The semantic version number for the AMI; the version string will be appended automatically to the name tags added to the resulting AMI and snapshot(s)"
}
