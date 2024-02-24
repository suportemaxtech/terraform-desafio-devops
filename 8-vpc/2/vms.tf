#Aula-08
resource "aws_instance" "vm" {
  for_each      = var.nomes
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.chave_ssh_desafio.key_name
  subnet_id     = aws_subnet.each.value.id 
  vpc_security_group_ids = [
    aws_security_group.exercicio_libera_ssh.id
  ]

  tags = {
    Name = each.key
  }
}