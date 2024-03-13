#/bin/bash

cd terraform/
terraform init
terraform apply -auto-approve

echo "Esperando a máquina carregar"

sleep 20 # espera
DNS=$(terraform output public_dns)
DNS=$(echo $DNS | sed -e "s/\"//g")

export RDS=$(terraform output rds)
RDS=$(echo $RDS | sed -e "s/\"//g")


cd ../ansible 

echo " 
[java-api-docker]
$DNS
" > hosts

ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ../../ssh/id_rsa

#acessar a maquina criada
ssh -i C:/Cursos/DevOps/terraform/ssh/id_rsa ubuntu@${DNS} -o ServerAliveInterval=60