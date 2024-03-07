#Aula-09

resource "aws_vpc" "vpc_desafio_devops" {
  cidr_block = "10.0.0.0/16"
  #habilita o dns automatico para as maquinas
  enable_dns_hostnames = true

  tags = {
    Name = "terraform_vpc_desafio_devops"
  }
}