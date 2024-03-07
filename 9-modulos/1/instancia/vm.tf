#Aula-12
resource "aws_instance" "vm" {
    ami = var.ami_id
    instance_type = var.tipo_instancia


    tags = {
      nome = var.nome_vm
    }
  
}