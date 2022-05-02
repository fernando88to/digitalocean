## Digital Ocean

Projeto de estudo de implantação de container com a digital ocean



### Configuração do github actions

Criar par de chave
    nome : ssh manjaro casa
    conteudo da chave pública cat ~/.ssh/id_rsa.pub
    
    
Para fazer o ssh basta:

```
ssh root@167.71.240.178
```


Examplo do github actions

    https://github.com/appleboy/ssh-action 


### Configuração do registry privado na digital ocean

Cria um registry privado

Cria uma API Token
    Para testar :

```
docker login registry.digitalocean.com
# docker login registry.digitalocean.com
 Username: <paste-api-token>
 Password: <paste-api-token>
```


https://faun.pub/full-ci-cd-with-docker-github-actions-digitalocean-droplets-container-registry-db2938db8246
