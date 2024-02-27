#Aula-10
resource "aws_route_table_association" "rts_" {
count           = length(keys(var.subnets))
subnet_id       = aws_subnet.subnets[count.index].index
route_table_id  = aws_route_table.rt_desafio_devops.id
}
