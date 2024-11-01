# Elementos essenciais do AWS Cloud Practitioner (Português) | AWS Cloud Practitioner Essentials (Portuguese)

[https://explore.skillbuilder.aws/learn/course/internal/view/elearning/8287/aws-cloud-practitioner-essentials-portuguese?trk=7824700d-6ab3-41b3-84ae-06e9bced9717&sc_channel=el](https://explore.skillbuilder.aws/learn/course/internal/view/elearning/8287/aws-cloud-practitioner-essentials-portuguese?trk=7824700d-6ab3-41b3-84ae-06e9bced9717&sc_channel=el)

## Módulo 1: Introdução à Amazon Web Services
### Introdução ao módulo 1

### Computação em nuvem

Benefícios da computação em nuvem

- Troque despesas iniciais por despesas variáveis
- Pare de gastar dinheiro para executar e manter data centers
- Pare de tentar adivinhar a capacidade
- Beneficie-se de grandes economias de escala
- Aumentar a velocidade e a agilidade
- Ter alcance global em minutos

Questionário

## Módulo 2: Computação na nuvem
### Introdução ao módulo 2

### Tipos de instâncias do Amazon EC2
Questionário

### Definição de preços do Amazon EC2
- sob demanda
- saving planning (1 a 3 anos)
- instâncias reservadas 
- instâncias spot
- host dedicados

Questionário

### Scaling do Amazon EC2

### Direcionamento de tráfego com o Elastic Load Balancing

### Sistema de mensagens e enfileiramento
Questionário

### Outros serviços de computação
- EC2
- Lambda
- ECS
- EKS
- AWS Fargate

### Resumo do módulo 2

### Questionário do módulo 2

## módulo 3:Infraestrutura global e confiabilidade
### Introdução ao módulo 3
- auta disponibilidade e tolerância a falhas.
- área de disponibilidade

### Infraestrutura global da AWS
- regiões (São Paulo, Ohio, Dublin)
- dados de uma região somente são enviados com permissões 
- disponibilidade de recursos. Alguns recursos não estão disponíveis em algumas regiões.
- preço (algumas regiões são gratuitas). Cada região possui um precificação

Portanto, considere quatro fatores importantes ao escolher uma região:  
- conformidade
- proximidade
- disponibilidade de recursos 
- preço

Questionário


**Zonas de disponibilidade**
- grupo de datacenters fazem parte de uma zona de disponibilidade (AZ)


### Locais de borda
- CDN (amazon cloud front). Usa locais de bordas para reduzir o tempo de resposta.
- Os locais de borda executam um serviço de DNS (amazon route 53).
- Usar serviços da aws dentro da empresa (amazon outposts)

Pontos principais:
- regiões área geograficamente isoladas
- regiões tem zona de disponibilidades (AZ)
- edge location (locais de borda executam no cloudfront) 

### Como provisionar recursos AWS
- tudo na AWS é via API
- console da AWS 
- aws command line: CLI
- SDK, através das linguagens de programação
- terraform ou cloudformation

**Interação com a AWS:**
- AWS Elastic beanstalk 
- AWS cloudformation (IAAC)

### Resumo do módulo 3
- zona de disponibilidades
- regiões
- implante Infraestrutura em pelo menos 2 AZ
- Locais de borda
- AWS outposts
- provisionamento de recursos: 
  - como o console de gerenciamento da AWS
  - SDKs
  - CLI
  - AWS Elastic Beanstalk
  - AWS CloudFormation

### Questionário do módulo 3

## Modulo 04: Redes
### Introdução ao módulo 4

### Conectividade com a AWS
- VPC
- sub-redes
- gateway de internet (entrada pública)
- gateway privado virtual (liga rede VPC com outra rede interna)
- aws direct connection (liga rede privada do seu datacerter com a rede da AWS)

### Sub-redes e listas de controle de acesso à rede
- proteção de rede
  - ACL de rede: só define quem entra ou sai, mas não define uqal recurso pode acessar
    - por padrão permite todo mundo entrar e sair até vc aplicar regras
  - grupo de segurança: define quem pode acessar qual recurso (instânica na VPC). Pode definir que protocolo pode entrar (HTTP, por exemplo), mas deixa tudo que entrou sair.
  - grupo de segurança é statefull e ACL é stateless
  - 

Questionário

### Redes globais
- route 53 (DNS)
- amazon cloud front (CDN): usa locais de borda (edge location)
- Políticas de roteamento do amazon route 53:
  - baseado em latência
  - dns de geolocalização
  - rotemanento de geoproximidade
  - pesos

Questionário

### Resumo do módulo 4
- VPC
- gateway de internet, acls de rede e grupos de segurança
- vpn e direct connect
- locais de borda
- route 53 para DNS
- amazon cloud front

### Questionário do módulo 4

## Modulo 05: Armazenamento e banco de dados
### Introdução ao módulo 5

### Armazenamentos de instância e Amazon Elastic Block Store (Amazon EBS)
- instance store (temporário): volume de Armazenamento de instância
- EBS: Amazon Elastic Block Store: vollumes do EBS
  - snapshots: backup de volumes de instância

Um snapshot do EBS(opens in a new tab) é um backup incremental. Isso significa que o primeiro backup de um volume copia todos os dados. Nos backups subsequentes, somente os blocos de dados que foram alterados desde o snapshot mais recente são salvos. 

Questionário

### Amazon Simple Storage Service (Amazon S3)
- S3 (Amazon Simple Storage Service)
  - armazena dados como objetos
  - Usado para hospedagem de sites
- Amazon S3 Standard (S3 Standard)
- S3 Standart IA (S3 Standard-Infrequent Access)
- S3 Glacier Flexible Retrieval
- politicas de ciclo de vida de um objeto no S3
- S3 One Zone-Infrequent Access
- S3 Glacier Instant Retrieval
- S3 Glacier Deep Archive
- S3 Intelligent Tiering

Questionário

A storage class S3 Standard-IA é ideal para dados acessados com pouca frequência, mas que precisam ter alta disponibilidade quando necessário. O S3 Standard e o S3 Standard – IA armazenam dados em um mínimo de três Zonas de Disponibilidade. O S3 Standard-IA tem o mesmo nível de disponibilidade que o S3 Standard, mas a um preço de armazenamento mais baixo.

As outras respostas estão incorretas porque:

na storage class S3 Intelligent-Tiering, o Amazon S3 monitora os padrões de acesso dos objetos. Se você não acessou um objeto por 30 dias consecutivos, o Amazon S3 o move automaticamente para o nível de acesso pouco frequente S3 Standard-IA. Se você acessar um objeto no nível de acesso pouco frequente, o S3 vai movê-lo automaticamente para o nível de acesso frequente S3 Standard.
O S3 Glacier Flexible Retrieval e o S3 Glacier Deep Archive são storage classes de baixo custo ideais para arquivamento de dados. Eles não seriam a melhor escolha para esse cenário, pois alta disponibilidade é necessária. É possível recuperar objetos armazenados na storage class S3 Glacier Flexible Retrieval de alguns minutos a algumas horas. Em comparação, é possível recuperar objetos armazenados na storage class S3 Glacier Deep Archive em até 12 horas.

#### **Comparação entre EBS e S3:**
Round 1 (S3): Para um site de análise de fotos que armazena e exibe milhões de imagens, o S3 é ideal. Ele permite armazenar objetos (imagens) com URLs controladas e acesso configurável, é altamente durável (99,999999999%) e econômico comparado ao EBS. O S3 é "serverless" e regionalmente distribuído, dispensando EC2 para hospedagem, sendo ideal para armazenamento de arquivos inteiros que não exigem atualização constante.

Round 2 (EBS): Para edição de vídeos pesados (80GB, por exemplo), o EBS, com armazenamento em blocos, é mais adequado. Ele permite editar partes específicas de um arquivo sem reescrevê-lo completamente, economizando tempo e recursos em tarefas de edição frequente, que seriam ineficazes no S3.

Conclusão: O S3 é ideal para armazenar arquivos inteiros acessados ocasionalmente, enquanto o EBS é preferível para arquivos que exigem edições constantes e pontuais. A escolha entre S3 e EBS depende das necessidades específicas da carga de trabalho.

### Amazon Elastic File System (Amazon EFS)
- Amazon EFS: Amazon Elastic File System
  - várias instancias podem acessa os dados do EFS em simultaneamente

#### Comparação entre o Amazon EBS e o Amazon Elastic File System
**EFS**    
O Amazon Elastic File System é um serviço regional. Ele armazena dados em várias Zonas de Disponibilidade e entre elas.    
O armazenamento duplicado permite que você acesse dados simultaneamente de todas as Zonas de Disponibilidade na Região em que um sistema de arquivos está localizado. Além disso, os servidores on-premises podem acessar o Amazon Elastic File System usando o AWS Direct Connect.

**EBS**    
Um volume do Amazon EBS armazena dados em uma única Zona de Disponibilidade.    
Para anexar uma instância do Amazon EC2 a um volume do EBS, tanto a instância do Amazon EC2 quanto o volume do EBS precisam residir na mesma Zona de Disponibilidade.

### Amazon Relational Database Service (Amazon RDS)
