resource "aws_instance" "ansible_controller" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.pub_sub_1.id
  vpc_security_group_ids      = [aws_security_group.alb_sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true

  tags = {
    Name = "ansible-controller"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install ansible2 -y
              EOF
}

resource "aws_instance" "jenkins_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.pub_sub_2.id
  vpc_security_group_ids      = [aws_security_group.alb_sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true

  tags = {
    Name = "jenkins-server"
  }
}
