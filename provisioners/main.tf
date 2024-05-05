resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.component
  }
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = var.ssh_user
      password = var.ssh_pass
      host     = self.public_ip
    }
    inline = [
       "sudo dnf install nginx -y"

    ]
  }
}

