variable "arquivos" {
  description    =  "Digite seu nome"

}

resource local_file "multifiles" {
  filename             = "seu nome.txt"
  content              = var.arquivos

}
