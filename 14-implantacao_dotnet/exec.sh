#/bin/bash

cd terraform/
terraform init
terraform apply -auto-approve

ANSIBLE_RETORNO=$(terraform output)
DNS=(${ANSIBLE_RETORNO//=/}) #usando o split para pegar o dns
DNS=${DNS[1]} # #pegando o index de 1

#retirando as aspas do retorno do dns com replace
DNS=$(echo $DNS | sed "s/\"//g")

# ANSIBLE_RETORNO=$(terraform output)
# DNS=(${ANSIBLE_RETORNO//=/}) #usando o split para pegar o dns
# DNS=${DNS[1]} # #pegando o index de 1

cd ../ansible # entrar no diretorio do ansibel

#Criando o arquivo de hosts
echo " 
[dotnet]
$DNS"> hosts

 # para evitar o fingprint do ssh  ocolocar variavel de ambiente antes para  o yes do ssh
    ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ../../ssh/id_rca

#acessar a maquina criada
ssh -i C:/Cursos/DevOps/terraform/ssh/id_rsa ubuntu@${DNS} -o ServerAliveInterval=60