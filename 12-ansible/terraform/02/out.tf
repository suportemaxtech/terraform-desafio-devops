output "informacoes_vms" {
  value = [
    for vm in aws_instance.vm :
    "ssh -i C:/Cursos/DevOps/terraform/ssh/id_rsa ubuntu@${aws_instance.vm.public_dns} -o ServerAliveInterval=60 "
  ]

}


