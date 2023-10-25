# estudo-aws
Estudo AWS

## Anotações da playlis AWS ECS Fargate: Criando e deployando uma aplicação Node.js
### Build da imagem localmente
```bash
# entra no diretório
cd playlist-youtube-ecs-fargate-node

# cria build da imagem
docker build -t fargate-nodejs-app .

# executa localmente
docker run -p 3000:3000 fargate-nodejs-app

# Comandos usados para realizar o debug do build da imagem
# Obs: meu container estava com algum problema para acessar a internet
docker run -it --network=host \
--volume /home/adriano/Downloads/testes/docker-clones/estudo-aws/playlist-youtube-ecs-fargate-node:/home/node/ \
node:18-alpine sh
```
Para acessar a aplicação localmente acesse: [http://localhost:3000](http://localhost:3000)


### Criar ECR
No console da AWS em ECR, defina os seguinte valores:
- Configurações de visibilidade: privado
- Nome do repositório: fargate-nodejs-app
- Nome da imagem: aws-ecs-fargate-node

```bash
# realiza login no ECR
#Obs: --profile foi usado porque tenho um profile customizado
aws ecr get-login-password --region us-east-1 \
--profile sandbox | docker login \
--username AWS \
--password-stdin <ID_CONTA_AWS>.dkr.ecr.us-east-1.amazonaws.com

# cria tag para a imagem
docker tag fargate-nodejs-app:latest <ID_CONTA_AWS>.dkr.ecr.us-east-1.amazonaws.com/fargate-nodejs-app:latest

# envia imagem para o ECR
docker push <ID_CONTA_AWS>.dkr.ecr.us-east-1.amazonaws.com/fargate-nodejs-app:latest
```
### Configurando VPC, Internet Gateway, Subnets, Route Tables e NAT GaTeway
VPC:

- Nome: fna-vpc
- CIDR: 10.0.0.0/21

Subnets:

- Nome: fna-public-a
- AZ: us-east-1a
- CIDR: 10.0.1.0/24
- Nome: fna-public-b
- AZ: us-east-1b
- CIDR: 10.0.2.0/24
- Nome: fna-private-a
- AZ: us-east-1a
- CIDR: 10.0.3.0/24
- Nome: fna-private-b
- AZ: us-east-1b
- CIDR: 10.0.4.0/24

Internet gateway:

- Nome: fna-igw
- Clicar em Action > anexar VPC > fna-vpc

NAT gateway:

- Nome: fna-nat-gw-a
- Subnets: fna-public-a
- clicar em alocar Elastic IP

- Nome: fna-nat-gw-b
- Subnets: fna-public-b
- clicar em alocar Elastic IP

Configurar tabelas de roteamento:

Por padrão as subnets são definidas implicitamente nas tabelas de roteamento:

- Nome: fna-public-rt
  - clicar em edit subnets associations
  - selecione as subnets publicas e salve
  - na aba routes adicione uma nova rota com destination 0.0.0.0/0 e target apontando para o Internet gateway (fna-igw) e clique em save

- Nome: fna-private-a-rt
  - clicar em edit subnets associations
  - selecione a fna-private-a e salve
  - adiciona rota:
    - Destination: 0.0.0.0/0
    - Target: fna-nat-gw-a

- criar fna-private-b-rt
  - clicar em edit subnets associations
  - selecione a fna-private-b e salve
  - adiciona rota:
    - Destination: 0.0.0.0/0
    - Target: fna-nat-gw-b

### Configurando o Load Balancer
Vamos criar uma application load balancer

- Nome: fna-alb
- VPC: fna-vpc
- Subnets: fna-public-a, fna-public-b
- Security group:
  - Nome: fna-alb-sg
  - VPC: fna-vpc
  - Inbound rules:
     - Type: HTTP
     - Port: 80
     - Source: 0.0.0.0/0 (anywhere)
  - Outbound rules:
     - Protocol: All traffic
     - Destination: 0.0.0.0/0 (anywhere)
- Listener:
  - Protocol: HTTP
  - Port: 80
  - Action: forward to target group
  - Target group:
    - Baseado em IP
    - Name: fna-alb-tg
    - HTTP port: 80
    - VPC: fna-vpc
    - Health check: /healthcheck
    - Success codes: 200,204
      - Protocol: HTTP

### Configuração do cluster do ECS e acessando a aplicação
Cluster:

- Nome: fna-cluster

Task definition:

- Fargate
- Nome: fna-td
- Task role: none (não usaremos nenhuma acesso a outro recurso da AWS)
- Task execution: ecsTaskExecutionRole
- Container definition:
  - Nome: fna-random-dog
  - Image: URI da imagem do ECR criado acima
  - Port mappings: 3000
- Criar task definition

Service:

- Lanch type: Fargate
- Task definition: fna-td
- Cluster VPC: fna-vpc
- service name: fna-random-dog
- Number of tasks: 2
- Minimum healthcheckpercent: 100
- Maximum percent: 200
- subnets: fna-private-a, fna-private-b
- Security group: criará automaticamente
- Health check grace period: 30
- Load balancer
  - Application Load balancer
  - Load balancer name: fna-alb
- Container to load balance
  - Container name: port: fna-random-dog:3000:3000 e clique em adicionar
    - porta 80:HTTP
    - target group: fna-alb-tg


Atualizar SG do service (fna-random-dog)

Acesse o service e vá em atualizar, acesse a aba rede e clique no link do SG:

- atualize a entrada:
  - entrada: Todos os TCP 0 - 65535 
  - origem: fna-alb-sg


## Links
- AWS ECS Fargate: Criando e deployando uma aplicação Node.js:
  - [AWS ECS Fargate: Criando e deployando uma aplicação Node.js](https://www.youtube.com/playlist?list=PLWQmZVQayUUI5RinDqpoIXiRYWy5YZKjs)
  - [Ferramenta CIDR](https://cidr.xyz/)
  - [O que é CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
  - [Fargate Network Mode](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html#fargate-tasks-networkmode)
  - [Analogia de uma VPC completa](https://start.jcolemorrison.com/aws-vpc-core-concepts-analogy-guide/)
  - [Post oficial da AWS sobre a rede de uma task no Fargate](https://aws.amazon.com/blogs/compute/task-networking-in-aws-fargate/)
