#Aula-09
resource "aws_internet_gateway" "gw"{
vpc_id = aws_vpc.vpc_desafio_devops

tags = {
  Name = "gw_desafio_devops"
}

}