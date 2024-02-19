resource local_file "criando_arquivo" {
  filename             = "primeiro_arquivo_tf.txt"
  content              = "estamos aprendendo o terraforme utilizando a linguagem HCL"
  file_permission      = 0777
  directory_permission = 0777
}
