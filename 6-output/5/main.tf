variable "clientes" {
  type = list(map(string))
  default    = [
    {
    "nome": "max",
    "telefone": "(95)99113-3704",
    "cpf": "123456789",
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



