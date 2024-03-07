#Aula-07
variable "senha" {
  type = string
  sensitive = true 
  description = "Digite sua senha"
}
  


#ocultar a senha
output "senha_digita" {
  value = "A senha digitada foi :${var.senha}"
  sensitive = true

}



