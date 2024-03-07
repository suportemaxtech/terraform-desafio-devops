resource "aws_instance" "vm" {
  count         = 2
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.nano"
  # usou concatenação de todos os resources do aws_key_pair
  key_name = aws_key_pair.chave_ssh_desafio.key_name

  # usou concatenação de todos os resources do aws_security_group
  vpc_security_group_ids = [
    aws_security_group.libera_ssh.id
  ]

  tags = {
    Name = "MinhaPrimeiraMaquina-${count.index}" #nome da maquina
  }
}