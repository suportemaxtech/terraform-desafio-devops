

ANSIBLE_RETORNO=$(terraform output)
DNS=(${ANSIBLE_RETORNO//=/}) #usando o split para pegar o dns
DNS=${DNS[1]} # #pegando o index de 1

#retirando as aspas do retorno do dns com replace
DNS=$(echo $DNS | sed "s/\"//g")

# ANSIBLE_RETORNO=$(terraform output)
# DNS=(${ANSIBLE_RETORNO//=/}) #usando o split para pegar o dns
# DNS=${DNS[1]} # #pegando o index de 1



#Criando o arquivo de hosts
echo " 
[maquina_wordpress]
$DNS"> hosts