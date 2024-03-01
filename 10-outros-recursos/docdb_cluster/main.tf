provider "" {
  region = "us-east-1"
}
#cluster é um pool, conjunto de servidores escalavel,
resource "aws_docdb_cluster_instance" "cluster_instances" {
    count           = 2 # replicas da instancia principal
    identifier      = "docdb-cluster-replica-${count.index}"
    cluster_identifier = aws_docdb_cluster.docdb.id
    instance_class  = "db.r5.large"
  
}

resource "aws_docdb_cluster" "docdb" {
    cluster_identifier = "my-docdb-cluster" # instancia principal
    engine = "docdb" #tipo de banco
    master_username = "maxxavier"
    master_password = "secreto123"
    vpc_security_group_ids = ["${aws_security_group.acesso_docdb.id}"]
    backup_retention_period = 1 # periodo de back
    preferred_backup_window = "07:00-09:00" #hora que vai realizar o backup
    deletion_protection = false # não protegido para exclusão
    skip_final_snapshot = true #não cria snapshot , caso de erro não tem copia

    tags = {
      Name = "meu_docdb"
    }
  
}