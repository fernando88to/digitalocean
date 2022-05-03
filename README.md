## Digital Ocean

Projeto de estudo de implantação de container com a digital ocean


### Instalação do docker no droplet

```
#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-pt
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
```


### Liberar as portas no droplet

```
sudo ufw allow 80
sudo ufw allow 443
```


### Configuração do github actions

Criar par de chave
    nome : ssh manjaro casa
    conteudo da chave pública cat ~/.ssh/id_rsa.pub
    


### Para fazer acesso ssh no droptlet da minha máquina

A chave pública da minha máquina está configurada no dropt

Para fazer o ssh basta:

```
ssh root@167.71.240.178
```

### Configuração do registry privado na digital ocean

Cria um registry privado.
A Criação de chave fica no menu  lateral chamado API 

Cria uma API Token
    Para testar :

```
docker login registry.digitalocean.com
# docker login registry.digitalocean.com
 Username: <paste-api-token>
 Password: <paste-api-token>
```


### Processo de registro do domínio

* Criar um registro no registro.br
* Depois de pago e registrado 
* Na digital ocean vai no menu lateral Networking e adiciona o dominio apotando para um droplet
* Ainda na digital ocean 
* Abre o registro.br e vai para a seção de registro (DNS) seleciona 



### Registro do dominio

* Vai no menu lateral em doplets, seleciona o droplet e vai para a opção 'Add a domain'
* Adiciona o dominio e verifica se o dominio está livre, se estiver vai aparecer vários dados em abaixo.
* Vai no registro BR e já coloca os 3 DNS padrão da digital ocean
* Pronto
* Para funcionar com www, vai na seção de registros opção 'A' no hostname coloca 'www', para qual drop irá 
* redirecionar e criar o record. Para esse isso funcionar tem que configurar no nginx. 

