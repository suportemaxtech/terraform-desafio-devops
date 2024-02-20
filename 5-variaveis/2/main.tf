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

resource local_file "multifiles" {
  filename             = "seu nome.txt"
  content              = <<EOF
  Nome:${var.nome}
  Idade:${var.idade}
  Casado:${var.casado}
  
  EOF

}
