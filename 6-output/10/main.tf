
variable "nome" {
  type = string
  description    =  "Digite seu nome"

  validation {
  condition = length(var.nome) > 10
  error_message = "Voce digitou o nome com tamanho errad."
}
}

variable "idade" {
  type = number
  description    =  "Digite sua idade"
}

variable "casado" {
  type = bool
  description    =  "Digite se é casado? (true/false)"

validation {
  condition = !var.casado
  error_message = "Neste time só pode entrar pessoas solteiras."
}
}


