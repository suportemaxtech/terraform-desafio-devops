#Aula-13
resource "aws_security_group" "acesso_docdb" {
  name        = "libera_docdb_desafio_devops"
  description = "Libera a porta 27017 para as maquinas criadas no desafio devops"
  #vpc_id      = aws_vpc.vpc_desafio_devops.id
  #array lista de dados liberação das saidas
  egress = [
    {
      # todas as portas 0
      from_port = 0
      # todas as portas 0
      to_port = 0
      #qualquer protocolo -1
      protocol = "-1"
      #array lista de blocos
      cidr_blocks      = ["0.0.0.0/0"] #qualquer pode acessar
      ipv6_cidr_blocks = ["::/0"]
      description      = "leberacao geral na parte interna"
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  #array lista de dados liberação das entrasa
  ingress = [
    {
      # portas 22
      from_port = 27017

      to_port = 27017

      protocol = "tcp"
      #array lista de blocos
      cidr_blocks      = ["0.0.0.0/0"] #qualquer um pode acessar
      ipv6_cidr_blocks = ["::/0"]      #qualquer um pode acessar
      description      = "leberacao geral de fora para dentro"
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
}


