resource "aws_security_group" "libera_ssh_ansible" {
  name        = "libera_ssh_ansible"
  description = "Libera a porta 22 para as maquinas criadas no desafio devops"

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
      from_port = 22

      to_port = 22

      protocol = "tcp"
      #array lista de blocos
      cidr_blocks      = ["0.0.0.0/0"] #qualquer um pode acessar
      ipv6_cidr_blocks = ["::/0"]      #qualquer um pode acessar
      description      = "leberacao geral de fora para dentro"
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },

      {
      # portas 80
      from_port = 80

      to_port = 80

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


