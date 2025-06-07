variable "ami_id" {
  default = "ami-0fc5d935ebf8bc3bc" # Ubuntu 22.04
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "iac"  # Replace with your key pair name
}

variable "repo_url" {
  default = "https://github.com/techeazy-consulting/techeazy-devops.git"
}
