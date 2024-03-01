#Aula-13
resource "aws_db_instance" "rds" {
  engine = "mysql" #postgres oraclo etc...
  engine_version = "8.0"
  instance_class = "db.t2.micro" #tipo de maquina
  db_name = "db_mysql_desafio" # nome do banco
  username = "max"
  password = var.rds_senha
  allocated_storage = 5 # tamanho em gigas do banco de dados
  publicly_accessible = true # para poder acessar do computador
  vpc_security_group_ids = [
    aws_security_group.libera_mysql.id
  ]
backup_retention_period = 0 # perdiodo de backup, 0 = nenhum
#peferred_backup_window = "01:00-10:00" # horario preferido para backup
deletion_protection = false # proteção desabilitada para deletar o banco
skip_final_snapshot = true # ingnora o backup snapshot

tags = {
  "Name" = "rds_desafio_devops"
}
}

# colocar variavel de ambiente no script para uma senha segura
#TF_VAR_rds_senh="maxxavier123" terraform apply -auto-approve
      
