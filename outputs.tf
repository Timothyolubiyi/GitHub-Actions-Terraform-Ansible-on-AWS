output "ansible_controller_public_ip" {
  value = aws_instance.ansible_controller.public_ip
}

output "jenkins_server_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
