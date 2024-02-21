#Aula-07
variable "cliente" {
  type = map(string)
  default    =  {
    "nome": "max",
    "telefone": "(95)99113-3704",
    "cpf": "123456789",
  }
   
}


#listar todos do cliente
output "dados_do_cliente" {
  value = [
for key, value in var.cliente:
  "${key}: ${value}"
  ]   
  
}



