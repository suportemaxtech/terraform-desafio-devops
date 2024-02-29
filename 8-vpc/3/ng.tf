#Aula-11
resource "aws_nat_gateway" "ng" {
   allocation_id = aws_eip.elastic_ip.id
   subnet_id = aws_subnet.subnets[0].id

   tags = {
     Name = "NAT_desafio_devops"
   }
  depends_on = [ aws_subnet.subnets ]
}