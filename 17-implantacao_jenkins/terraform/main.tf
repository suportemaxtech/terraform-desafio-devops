provider "aws" {
  region = "us-east-1"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com" # outra opção "https://ifconfig.me"
}

resource "aws_key_pair" "chave_ssh_jenkins" {
  key_name   = "chave_ssh_desafio_pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDFc7h5ycmymclma79v1DUbUimK/EIWO9o9sG+PxdTpZrKP6Mee1qdSLejoKiDDshrhvLTQQ2PAJD7xVZ/1hpWQNXzEZ224LDnPaBKq0lsmfaKbI7JX3Im5vAHk1AxIOIqOtb1oWqSCYptyTpifJDkEYZ/jmxgTJ37sw6noYLQy7EHBGNG8phjmsaceCQVTyWSld2kacGKCIM84SCS8/CizNspsV5O6au4zP+uftS42DdwZRfvTupNNZvGdfI7qmzw+3FtUpgP+o1l4SdG8hFid2ToUNMFtu4vC4TGQ8soh6ZAZIZUh6V53KJGSSwf0asuir1lxXvBm33W8/KaAcgTFtITiH6mCMIxKdXBeGOGkJ93XpIZywJK6mpr3mijc/tEiaiT48ibbPqqz3JFTyXndtLOS6fBLz9302fVr6sr+Sh7PGZfxKICq2YW6I00hsqb0Y5xJiBuMvB7gShYq+SD1p3kP1r8NR/oVvLoYrnCjAhA64JnPQ6CE5ZlJxziL18= maxxa@DESKTOP-6D617KR"
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
    "ssh -i /c/Cursos/DevOps/terraform/ssh/id_rsa ubuntu@${aws_instance.jenkins.public_dns}"
  ]
}