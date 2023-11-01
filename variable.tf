#vpc: The ID of the VPC that the Jenkins server will be created in.
variable "vpc" {
  description = "The Default VPC of EC2"
  type        = string
  default     = "your VPC ID Here"
}

variable "ami" {
  description = "The AMI ID of your Instance"
  type        = string
  default     = "your AMI Here"
}

variable "instance" {
  description = "The Instance Type of EC2"
  type        = string
  default     = "t2.micro"
}

#ec2_user_data: bootstrap start of Jenkins Server
variable "ec2_user_data" {
  description = "User Data for Jenkins EC2"
  type        = string
  default     = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  sudo yum upgrade
  sudo amazon-linux-extras install java-openjdk11 -y
  sudo yum install -y jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
}
