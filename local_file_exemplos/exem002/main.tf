resource local_file "criando_arquivos" {
  count                = 5
  filename             = "arquivos_${count.index}_tf.txt"

}
