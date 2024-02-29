#Aula-11
resource "aws_route_table_association" "rts_" {
count           = length(keys(var.subnets))
subnet_id       = aws_subnet.subnets[count.index].id
route_table_id  = aws_route_table.rt_desafio_devops.id
}


resource "aws_route_table_association" "rts_privada" {
count           = length(keys(var.subnets_privada))
subnet_id       = aws_subnet.subnets_privada[count.index].id
route_table_id  = aws_route_table.rt_desafio_devops_Privada.id
}
