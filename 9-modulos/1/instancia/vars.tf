#Aula-12
variable "nome_vm" {
  type = string
  description = "variavel de entrada para nomes"
}

variable "tipo_instancia" {
  type = string
  description = "variavel para tipo de instancia. ex t2.micro"
}

variable "ami_id" {
  type = string
  description = "variavel para AMI. ex AMI - 00000000455"
}