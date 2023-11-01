resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance
  user_data              = var.ec2_user_data
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = "yash_key"
  tags = {
    Name = "YashTFInstance"
  }
}

resource "aws_security_group" "security_group" {
  vpc_id = var.vpc
  ingress {
    description = "Allow SSH from my Public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allows Access to the Jenkins Server"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allows Access to the Jenkins Server"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Jenkins-SG"
  }
}
