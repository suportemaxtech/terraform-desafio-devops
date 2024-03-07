#Aula-11

resource "aws_instance" "vm" {
  count                          = length(var.nomes)
  ami                            = data.aws_ami.ubuntu.id
  instance_type                  = var.instance_type
  key_name                       = aws_key_pair.chave_ssh_desafio.id
  subnet_id                      = aws_subnet.subnets[index(keys(var.subnets), var.nomes[count.index].subnet)].id
  associate_public_ip_address    = true
  vpc_security_group_ids         = [aws_security_group.exercicio_libera_ssh.id]

  tags = {
    Name = var.nomes[count.index].nome
  }
  
}

resource "aws_instance" "vm_privadas" {
  count                          = length(var.nomes_privados)
  ami                            = data.aws_ami.ubuntu.id
  instance_type                  = var.instance_type
  key_name                       = aws_key_pair.chave_ssh_desafio.id
  subnet_id                      = aws_subnet.subnets_privada[index(keys(var.subnets_privada), var.nomes_privados[count.index].subnet)].id
  associate_public_ip_address    = false
  vpc_security_group_ids         = [aws_security_group.exercicio_libera_ssh.id]

  tags = {
    Name = var.nomes_privados[count.index].nome
  }
  
}










# resource "aws_instance" "vm" {
#   for_each      = var.nomes
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   key_name      = aws_key_pair.chave_ssh_desafio.key_name
#   subnet_id     = aws_subnet.each.value.id 
#   associate_public_ip_address = true
#   vpc_security_group_ids = [
#     aws_security_group.exercicio_libera_ssh.id
#   ]

#   tags = {
#     Name = each.key
#   }
# }