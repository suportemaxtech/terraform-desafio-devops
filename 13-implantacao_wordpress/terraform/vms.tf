resource "aws_instance" "vm" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id = "subnet-02802464d275b9e57"

  key_name                    = aws_key_pair.chave_ssh_ansible.key_name
  vpc_security_group_ids = [aws_security_group.libera_ssh_ansible.id
  ]



  tags = {
    Name = "maquina_wordpress" #nome da maquina
  }
}