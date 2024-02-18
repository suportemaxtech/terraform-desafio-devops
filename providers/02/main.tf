provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "vm" {
    ami= "ami-0c7217cdde317cfec"
    instance_type = "t2.nano"
    key_name = "aws_key_pair.chave_ssh_desafio.key_name"

    tags = {
        Name = "MinhaPrimeiraMaquina"
    }
}

resource "aws_key_pair" "chave_ssh_desafio" {
    key_name = "chave_ssh_desafio_pub"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDFc7h5ycmymclma79v1DUbUimK/EIWO9o9sG+PxdTpZrKP6Mee1qdSLejoKiDDshrhvLTQQ2PAJD7xVZ/1hpWQNXzEZ224LDnPaBKq0lsmfaKbI7JX3Im5vAHk1AxIOIqOtb1oWqSCYptyTpifJDkEYZ/jmxgTJ37sw6noYLQy7EHBGNG8phjmsaceCQVTyWSld2kacGKCIM84SCS8/CizNspsV5O6au4zP+uftS42DdwZRfvTupNNZvGdfI7qmzw+3FtUpgP+o1l4SdG8hFid2ToUNMFtu4vC4TGQ8soh6ZAZIZUh6V53KJGSSwf0asuir1lxXvBm33W8/KaAcgTFtITiH6mCMIxKdXBeGOGkJ93XpIZywJK6mpr3mijc/tEiaiT48ibbPqqz3JFTyXndtLOS6fBLz9302fVr6sr+Sh7PGZfxKICq2YW6I00hsqb0Y5xJiBuMvB7gShYq+SD1p3kP1r8NR/oVvLoYrnCjAhA64JnPQ6CE5ZlJxziL18= maxxa@DESKTOP-6D617KR"
}

