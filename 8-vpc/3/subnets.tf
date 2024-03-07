#Aula-11
resource "aws_subnet" "subnets" {
  count             = length(keys(var.subnets))
  vpc_id            = aws_vpc.vpc_desafio_devops.id
  cidr_block        = var.subnets[keys(var.subnets)[count.index]].cdir
  availability_zone = var.subnets[keys(var.subnets)[count.index]].zona

  tags = {
    "Name" = keys(var.subnets)[count.index]
  }
}

resource "aws_subnet" "subnets_privada" {
  count             = length(keys(var.subnets_privada))
  vpc_id            = aws_vpc.vpc_desafio_devops.id
  cidr_block        = var.subnets_privada[keys(var.subnets_privada)[count.index]].cdir
  availability_zone = var.subnets_privada[keys(var.subnets_privada)[count.index]].zona

  tags = {
    "Name" = keys(var.subnets_privada)[count.index]
  }
}