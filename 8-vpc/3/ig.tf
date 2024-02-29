#Aula-10
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_desafio_devops.id

  tags = {
    Name = "gw_desafio_devops"
  }

}