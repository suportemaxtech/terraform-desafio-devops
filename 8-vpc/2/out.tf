output "inforacoes_vms" {
  value = [
    for vm in aws_instance.vm :
    "ssh -i C:/Cursos/DevOps/terraform/ssh/id_rsa ubuntu@${vm.public_dns} -o ServerAliveInterval=60 "
  ]

}
