#Aula-12


provider "aws" {
  region = us-east-1
}

module "vm" {
  
  source         = "github/pasta_instancias"
  nome_vm        = "vm_criada_com_modulo-02"
  tipo_instancia = "t3.micro"
  ami_id         = data.aws_ami.ubuntu.id
}

module "vm2" {
  for_each       = toset(["um","dois","tres"])
  source         = "github/pasta_instancias" # não precisa colocar https://
  nome_vm        = each.value
  tipo_instancia = "t2.micro"
  ami_id         = data.aws_ami.ubuntu.id
}
output "dns" {
  value = module.vm.public_dns
  
}

output "dns2" {
 value = [
    for vm in module.vm2:
    ${vm.public_dns}
      
 ] 
  
}






















# provider "aws" {
#   region = us-east-1
# }

# module "vm" {
#   source         = "./instacia"
#   nome_vm        = "vm_criada_com_modulo"
#   tipo_instancia = "t2.micro"
#   ami_id         = data.aws_ami.ubuntu.id
# }
# module "vm2" {
#   source         = "./instacia"
#   nome_vm        = "vm_criada_com_modulo-02"
#   tipo_instancia = "t3.micro"
#   ami_id         = data.aws_ami.ubuntu.id
# }

# output "dns" {
#   value = module.vm.public_dns
  
# }

# output "dns2" {
#   value = module.vm2.public_dns
  
# }