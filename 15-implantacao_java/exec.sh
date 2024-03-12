#/bin/bash

cd terraform/
terraform init
terraform apply -auto-approve

sleep 3

ANSIBLE_RETORNO=$(terraform output)
DNS=(${ANSIBLE_RETORNO//=/})
DNS=${DNS[1]}
DNS=$(echo $DNS | sed -e "s/\"//g")

cd ../ansible 

echo " 
[java]
$DNS
" > hosts

ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ../../ssh/id_rsa

#acessar a maquina criada
ssh -i C:/Cursos/DevOps/terraform/ssh/id_rsa ubuntu@${DNS} -o ServerAliveInterval=60