resource "aws_instance" "instance" {
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  tags = {
    Name = var.component
    monitor= "yes"
  }

}

resource "null_resource" "provisioner" {
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = var.ssh_user
      password = var.ssh_pass
      host     = aws_instance.instance.public_ip
    }
    inline = [
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/devps23/expense-ansible expense.yml -e env=${var.env} -e component_name=${var.component}"

    ]
  }
}
resource "aws_route53_record" "route" {
  name = "${var.component}-${var.env}.pdevops72.online"
  type = "A"
  zone_id = "Z09583601MY3QCL7AJKBT"
  records = [aws_instance.instance.private_ip]
  ttl = 30
}



