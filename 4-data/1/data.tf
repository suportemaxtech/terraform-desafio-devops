
data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] #  id master com permissão para buscar na aws

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-*"] # exemplo de como listar
    }
}

data "http" "api_via_cep" {
    url = "https://viacep.com.br/ws/01001000/json"
    request_headers = {
        accept = "application/json"
    }
}
