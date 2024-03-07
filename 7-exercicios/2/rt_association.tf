resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.subnet_a1.id
  route_table_id = aws_route_table.rt_desafio_devops.id
}

resource "aws_route_table_association" "b" {
  subnet_id = aws_subnet.subnet_b1
  route_table_id = aws_route_table.rt_desafio_devops.id
}

resource "aws_route_table_association" "c" {
  subnet_id = aws_subnet.subnet_c1
  route_table_id = aws_route_table.rt_desafio_devops.id
}