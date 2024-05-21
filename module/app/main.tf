resource "aws_security_group" "security" {
  name        = "security-${var.component}-${var.env}"
  description = "security-${var.component}-${var.env}"
  vpc_id      = var.vpc_id
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

resource "aws_instance" "component" {
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.security.id]
  subnet_id = var.subnets[0]
     instance_market_options {
      market_type = "spot"
      spot_options {
        instance_interruption_behavior = "stop"
        spot_instance_type             = "persistent"
      }
    }
  tags = {
    Name = var.component
    monitor= "yes"
  }

}

//here jsondecode to decode the secret credentials from vault server
//resource "null_resource" "provisioner" {
//  provisioner "remote-exec" {
//    connection {
//      type     = "ssh"
//      user     =  jsondecode(data.vault_generic_secret.rundeck_auth.data_json).user
//      password =  jsondecode(data.vault_generic_secret.rundeck_auth.data_json).pass
//      host     = aws_instance.component.public_ip
//
//    }
//    inline = [
//      "sudo pip3.11 install ansible",
//      "ansible-pull -i localhost, -U https://github.com/devps23/expense-ansible expense.yml -e env=${var.env} -e component_name=${var.component}"
//
//    ]
//  }
//}
//resource "aws_route53_record" "route_internal" {
//  name = "${var.component}-internal.pdevops72.online"
//  type = "A"
//  zone_id = "Z09583601MY3QCL7AJKBT"
//  records = [aws_instance.component.public_ip]
//  ttl = 30
//}
resource "aws_route53_record" "route" {
  name = "${var.component}-${var.env}.pdevops72.online"
  type = "A"
  zone_id = "Z09583601MY3QCL7AJKBT"
  records = [aws_instance.component.private_ip]
  ttl = 30
}
resource "aws_route53_record" "route-lb-dns" {
  count              = var.lb_req ? 1 : 0
  name = "lb-${var.component}-${var.env}.pdevops72.online"
  type = "CNAME"
  zone_id = "Z09583601MY3QCL7AJKBT"
  records = [aws_lb.lb[0].dns_name]
  ttl = 30
}
resource "aws_lb_target_group" "target" {
  count = var.lb_tg_group ? 1 : 0
  name     = "${var.env}-${var.component}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    Name = "${var.env}-${var.component}-tg"
  }
}
resource "aws_lb_target_group_attachment" "tg-attachment" {
  count            = var.lb_tg_group ? 1 : 0
  target_group_arn = aws_lb_target_group.target[0].arn
  target_id        = aws_instance.component.id
  port             = 80
}
resource "aws_lb" "lb" {
  count              = var.lb_req ? 1 : 0
  name               = "${var.env}-${var.component}-lb"
  internal           = var.lb_internet_type == "public" ? false : true
  load_balancer_type = "application"
  subnets            = var.lb_subnets
  tags = {
    Environment = "${var.env}-${var.component}-lb"
  }
}
resource "aws_lb_listener" "lb-listener" {
  count              = var.lb_req ? 1 : 0
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target[0].arn
  }
}







