resource "aws_security_group" "acesso_geral" {
  name = "acesso_geral"
  // vpc_id = "vpc-0c1cb11038b243da9"
  // security_group = [ "acesso_geral" ]
  description = "grupo de dev"

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
  }

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
  }


  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }


  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

  tags = {
    Name = "Wordpress_Mysql"
  }

}
