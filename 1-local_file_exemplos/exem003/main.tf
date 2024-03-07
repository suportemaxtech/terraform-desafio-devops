variable "arquivos" {
  default     = {
    "joao_paulo.txt" = "Olá joão"
    "joao_ghissard.sh" = "Olá joão grissard"
    "walter.txt" = "Olá walter"
     "woto.txt" = "Olá woto"
      "ana.txt" = <<EOF
       olá na , voce terá mais conteudo ainda separado por linhas assim como eu programei no HCL
      EOF

}
}

resource local_file "multifiles" {
  count                = length(keys(var.arquivos))
  filename             = keys(var.arquivos)[count.index]
  content              = var.arquivos[keys(var.arquivos)[count.index]]
  file_permission      = 0777
  directory_permission = 0777
}
