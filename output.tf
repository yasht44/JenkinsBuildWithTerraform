#The value of the output is the public IP address of the Jenkins server.

output "public_ip" {
  value = aws_instance.instance.public_ip
}
