resource "aws_security_group" "security" {
  name        = "security-${var.component}-${var.env}"
  description = "security-${var.component}-${var.env}"
  vpc_id      = var.vpc
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
     }
  tags = {
    Name = "sg-${var.component}"
  }
}

resource "aws_instance" "instance" {
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.security.id]
  subnet_id = var.subnets[0]
  tags = {
    Name = var.component
    monitor= "yes"
  }
  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }
}
//resource "aws_spot_instance_request" "spot_instances" {
//  ami           = data.aws_ami.ami.image_id
//  instance_type = var.instance_type
//  spot_type = "persistent"
//  instance_interruption_behavior = "stop"
//
//  tags = {
//    Name = var.component
//  }
//}
//here jsondecode to decode the secret credentials from vault server
//resource "null_resource" "provisioner" {
//  provisioner "remote-exec" {
//    connection {
//      type     = "ssh"
//      user     =  jsondecode(data.vault_generic_secret.rundeck_auth.data_json).user
//      password =  jsondecode(data.vault_generic_secret.rundeck_auth.data_json).pass
//      host     = aws_instance.instance.public_ip
//    }
//    inline = [
//      "sudo pip3.11 install ansible",
//      "ansible-pull -i localhost, -U https://github.com/devps23/expense-ansible expense.yml -e env=${var.env} -e component_name=${var.component}"
//
//    ]
//  }
//}
resource "aws_route53_record" "route" {
  name = "${var.component}-${var.env}.pdevops72.online"
  type = "A"
  zone_id = "Z09583601MY3QCL7AJKBT"
  records = [aws_instance.instance.private_ip]
  ttl = 30
}
resource "aws_route53_record" "route_internal" {
  name = "${var.component}-internal.pdevops72.online"
  type = "A"
  zone_id = "Z09583601MY3QCL7AJKBT"
  records = [aws_instance.instance.public_ip]
  ttl = 30
}



