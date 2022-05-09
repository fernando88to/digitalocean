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
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
#sudo ufw status verbose
```


### Configuração do github actions

Criar par de chave 
```
#Comando para criar par de chave
ssh-keygen
```


nome : ssh manjaro casa

conteudo da chave pública cat ~/.ssh/id_rsa.pub
    


### Para fazer acesso ssh no droptlet da minha máquina

A chave pública da minha máquina está configurada no dropt

Para fazer o ssh basta:

```
ssh root@167.71.240.178
```

### Configuração do registry privado na digital ocean

1. Cria um registry privado.
2. A Criação de chave fica no menu  lateral chamado API
3. Cria uma API Token no menu lateral.

4. Para testar :

```
docker login registry.digitalocean.com
# docker login registry.digitalocean.com
 Username: <paste-api-token>
 Password: <paste-api-token>
```


### Processo de registro do domínio

1. Criar um registro no registro.br
2. Depois de pago e registrado 
3. Na digital ocean vai no menu lateral Networking e adiciona o dominio apotando para um droplet
4. Ainda na digital ocean 
5. Abre o registro.br e vai para a seção de registro (DNS) seleciona 



### Registro do dominio na digital ocean

1. Vai no menu lateral em doplets, seleciona o droplet e vai para a opção 'Add a domain'
2. Adiciona o dominio e verifica se o dominio está livre, se estiver vai aparecer vários dados em abaixo.
3. Vai no registro BR e já coloca os 3 DNS padrão da digital ocean
4. Pronto
5. Para funcionar com www, vai na seção de registros opção 'CNAME' no hostname coloca 'www' , alias '@'. Para esse isso funcionar tem que configurar no nginx.


### Configuração do lestencrypt

A primeira vez tem que entrar no ssh e dar o seguinte comando dentro de /app/nginx.

No arquivo do nginx a parte do https tem que está desativar

```
#Criar o certificado inicial
docker-compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d applicacao.dev.br -d www.applicacao.dev.br

#força a renovação na marra
docker-compose run --rm  certbot certonly --force-renewal --webroot --webroot-path /var/www/certbot/ -d applicacao.dev.br -d www.applicacao.dev.br
# depois de atualizado o certificado, tem que atualizar o nginx
# enviará um sinal SIGHUP para o contêiner webserver recarregar a configuração do Nginx
docker-compose kill -s SIGHUP nginx_dev
```

Tem que configurar um crontab para rodar esse comando no host. (esses aqui não funcionaram) 

```
#Renova o certificado
docker-compose run --rm  certbot renew --webroot --webroot-path /var/www/certbot/
#depois de atualizado o certificado, tem que atualizar o nginx, esse comando é super rápido
docker-compose kill -s SIGHUP nginx_dev 
#Testa a renovação
docker-compose run --rm  certbot renew --dry-run --webroot --webroot-path /var/www/certbot/
 
```




### Secrets necessárias no github 

A secret são utilizdas pelo github actions.

| CHAVE | CATEGIRUA     | OBSERVAÇÃO           |
|------|---------------|----------------------|
| HOST | IP DO DROPLET |                      |
| KEY  | Chave privada do droplet | ~/.ssh/id_rsa (host) |
| PORT     | Porta de acesso ao ssh | |
| TOKEN_REGISTRY_DIGITAL_OCEAN     |Token de acesso ao registry digital ocean | |
| USERNAME     |Usuário do ssh do droplet | |

