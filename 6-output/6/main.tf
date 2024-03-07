#Aula-07
variable "clientes" {
  type = list(
    object({
      nome = string
      telefone = string
      cpf = number
    })


  default    = [
    {
    "nome": "max",
    "telefone": "(95)99113-3704",
    "cpf": "11122",
    "endereco": "rua das ruas",
  }
   ]
}


#listar todos do cliente
output "dados_do_clientes" {
  value = [
for obi in var.clientes:
  "Nome:${obi.nome}, Telefone:${obi.telefone},cpf: ${obi.cpf}, Endereço: ${obi.endereco}"
  ]   
  
}



