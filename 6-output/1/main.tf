#Aula-07
variable "nome" {
  type = string
  description    =  "Digite seu nome"
}

variable "idade" {
  type = number
  description    =  "Digite sua idade"
}

variable "casado" {
  type = bool
  description    =  "Digite se é casado? (true/false)"
}

output name {
  value       = var.nome
}

output idade {
  value       = var.idade
}

output casado {
  value       = var.casado
}