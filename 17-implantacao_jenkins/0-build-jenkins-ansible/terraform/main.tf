provider "aws" {
  region = "us-east-1"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com" # outra opção "https://ifconfig.me"
}

resource "aws_key_pair" "chave_ssh_jenkins" {
  key_name   = "chave_ssh_desafiodevops_jenkins"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfPo9Jfg91WGomDT4vrztzAEElMpKQfB7ZHvH12jRL5iNvLULrvRH0+AUMZnR9u+VBV6HYUhRqfmeicIZnaj/k6aE+lMVyu1lXzk3aiHvCOhqxs3hM7VhnV0hOiJR5N9QoUuHkM6z3JiL9xCS5Of0h/RIBwSn3Ga68+7LjApWCXUUh5rAP6AUEhaWkOMZqZHbGbyKcDrq9P24vbsETIb/frD/ZmQ/B2y/HQ1pIbDb2cqrkcpx61M77z7RloYzXEIN/fNrM3gjTC9tEZuoGb5LgGIfQrA17xdYc4QGL5Tt07sIgV2APVZHvDN49S8Nq5X4wwnfRaSJqVlyU8XiP/DxpjyhX9fOy6OEizmbmIM5xBem9AL2dPOzznclRvlxLIoUxeHWiKN69mWgBzEuvmBgDpDri79zFTZIczE/UGEMN55JmnZ7MRca0V+PE5ARVqUo7WIDVyUkqFLojz6lzoTyqU1JDYf2m1EE9Q0Y1BwAP+o5bEzV9FpIRP+LyPw+s/VE= max@DESKTOP-6D617KR"
}

resource "aws_instance" "jenkins" {
  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t2.large"
  key_name                    = aws_key_pair.chave_ssh_jenkins.key_name
  associate_public_ip_address = true
  subnet_id                   = "subnet-02802464d275b9e57"
  tags = {
    Name = "jenkins"
  }
  vpc_security_group_ids = [
    aws_security_group.jenkins.id
  ]
}

resource "aws_security_group" "jenkins" {
  name        = "acessos_jenkins"
  description = "acessos_jenkins inbound traffic"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
    {
      description      = "SSH from VPC"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "jenkins-lab"
  }
}

# terraform refresh para mostrar o ssh
output "jenkins" {
  value = [
    "jenkins",
    "id: ${aws_instance.jenkins.id}",
    "private: ${aws_instance.jenkins.private_ip}",
    "public: ${aws_instance.jenkins.public_ip}",
    "public_dns: ${aws_instance.jenkins.public_dns}",
    "ssh -i /mnt/c/Cursos/DevOps/terraform/ssh3/id_rsa ubuntu@${aws_instance.jenkins.public_dns}"
  ]
}