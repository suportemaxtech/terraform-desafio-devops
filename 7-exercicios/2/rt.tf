#Aula-09
resource "aws_route_table" "rt_desafio_devops" {
    vpc_id = aws_vpc.vpc_desafio_devops.id
    
    route = [ gw_desafio_devops ]
  
}