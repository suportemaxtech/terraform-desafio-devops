data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] #  id master com permissão para buscar na aws

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-fical-20.04-*"] # exemplo de como listar
    }
}