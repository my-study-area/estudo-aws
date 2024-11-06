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
- Aurora (Mysql e PostgreSQL): banco de dados relacional de nível empresarial
- RDS (Mysql, PostgreSQL, MariaDB, Microsoft SQL Server, Oracle DB): Amazon Relational Database Service
- Nigração lift-and-shift: migrar de um banco de dados para ser executado no EC2

### Amazon DynamoDB
- banco de dados sem servidor
- no sql (banco de dados não relacional)
- sem schema rígido
- é possível adicionar e remover atributos das tabelas
- totalmente gerenciável

**Comparando DynamoDB com Amazon RDS**

**RDS**
- alta disponibilidade
- cliente é proprietário dos dados
- cliente define o schema da tabela
- cliente controla a rede

**DynamoDB**
- usar par de chave valor
- capacidade de produção massíva
- não relacional
- não tem schema rígido
- acesso api granular

Questionário

### Amazon Redshift
- Data warehouse
- escala massiva de dados
- consulta direta no datalake
- capacidade de coletar dados de muitas fontes 

### AWS Database Migration Service
- migrar do banco de dados on premise, EC2 ou RDS 
- banco de dados de origem e destino podem ser diferentes
- Homogenos: estrutura  dos schemas e tipos de dados e código do banco de dados  são compatíveis entre a origem e o destino
- Heterogênios:  bancos de dados de origem e de destino são diferentes. As estruturas do schema, tipos de dados e código de banco de dados são diferentes  entre origem e destino.
- replicação contínua de dados

### Serviços de banco de dados adicionais
- Amazon DocumentDB: é um serviço de banco de dados de documentos compatível com cargas de trabalho do MongoDB
- Amazon Neptune: baco de dados de grafos
- Amazon Manage Blockchain: é um serviço para criar e gerenciar redes de blockchain com frameworks de código aberto.
- Amazon Quantum Ledger Database: é um serviço de banco de dados ledger. Você pode usar o Amazon QLDB para ver um histórico completo de todas as alterações feitas nos dados da aplicação.
- Amazon Elasticache com Redis e Memcached: é um serviço que adiciona camadas de cache sobre bancos de dados
- DAX (Amazon DynamoDB Accelerator): é um cache em memória do DynamoDB

### Resumo do módulo 5
- Armazenamento de instância do Amazon EC2 e Amazon EBS
- Amazon S3
- Amazon Elastic File System
- Bancos de dados relacionais e Amazon RDS
- Bancos de dados não relacionais e DynamoDB
- Amazon Redshift
- AWS DMS
- Outros serviços de banco de dados e aceleradoras

### Questionário do módulo 5

## Modulo 06: Segurança
### Introdução ao módulo 6

### Modelo de responsabilidade compartilhada da AWS
- AWS cuida da segurança da nuvem 
- você  cuida da segurança na nuvem

Questionário

### Permissões de usuário e acesso
- privilégio mínimo
- usuário raiz pode fazer qualquer coisa
- usuários que podem ser organizados em grupos
- políticas: são documentos que descrevem permissões e que podem ser anexadas a usuários ou grupos
- perfil ou "role"
  - existem permissões associadas
  - atribuídas por períodos temporários na sua conta AWS para usuários,  identidades externas, aplicações e até mesmo outros serviços da AWS
  - sem nome de usuários ou senha
  - uma identidade que recebe uma role ela recebe novas permissões e perde acesso as permissões anteriores.

### AWS Organizations
- um lugar central para gerenciar diversas contas
- compartilhar recursos entre as suas contas AWS
- gerenciamento centralizado
- cobrança consolidada (todas contas numa única conta) com cobranças e descontos
- organização hierarquicas
- control de acesso em serviços e recursos que cada usuário pode acessar

Com o AWS Organizations, você pode aplicar políticas de controle de serviço (SCPs) para a raiz da organização, uma conta de membro individual ou uma UO.

Você pode aplicar políticas do IAM a usuários, grupos ou perfis do IAM. Você não pode aplicar uma política do IAM ao usuário-raiz da conta AWS.

Questionário

### Conformidade
- RGPD: regulamento geral de proteção de dados (Europa)
- HIPAA: Lei de portabilidade e responsabilidade do seguro de saúde (EUA)
- AWS já contempla parte da conformidade da AWS
- o cliente é responsável pelo seus dados na AWS
- AWs Artifact para acessar documentos de conformidade para atender regulamentações
- 

Questionário

### Ataques de negação de serviço
- DOS (Denial of Service)
- DDOS (Distributed Denial of Service)
- inundação UDP. Solução: grupos de segurança
- ataques de nível HTTP. Solução: AWS Shield
- ataque slowloris: Solução Elastic Load Balancer
- AWs Shield com AWS WAF

### Serviços de segurança adicionais
- Criptografia de dados
  - repouso (Dynamodb e pode usar KMS)
  - transito: entre serviços: Amazon Redshift com SQL usando SSL
- Amazon inspector: avalia a segurança
  - verifica desviso de boa prática de segurança
  - exposição de instâncias do EC2
  - vunerabilidade
- Amazon GuardDuty: analisa fluxos contínuos de metadados gerados pela sua conta

### Resumo do módulo 6
- O modelo de responsabilidade compartilhada
- Recursos do AWS Identity and Access Management
- Métodos de gerenciamento de múltiplas contas no AWS Organizations
- Recursos de conformidade da AWS
- Serviços da AWS para segurança e criptografia das aplicações

### Questionário do módulo 6

## Módulo 07: Monitoramento e análise
### Introdução ao módulo 7

### Amazon CloudWatch
- monitorando recursos da AWS
- criar alarmes usando SNS
- dashboards de monitoramento
- todas métricas num local central
- visualizar aplicações e infra

### AWS CloudTrail
- realiza auditoria de chamadas de apis. Toda solicitação é registrada no CloudTrail
- salva os logs num bucket S3

Questionário

### AWS Trusted Advisor
- 5 pilares:
  - otimização de recursos
  - performance
  - segurança
  - tolerância a falhas
  - cotas de serviços

Como Posso Seguir em Frente Sem Limite?

- C: Custo (Otimização de Custos)
- P: Performance (Desempenho)
- S: Segurança (Segurança)
- F: Falhas (Tolerância a Falhas)
- S: Serviço (Limites de Serviço)

### Resumo do módulo 7
- Amazon CloudWatch
- AWS CloudTrail
- AWS Trusted Advisor

### Questionário do módulo 7

## Módulo 08: Definição de preço e suporte
### Introdução ao módulo 8

### Nível gratuito da AWS
- Free tier
  - sempre gratuito
  - 12 meses grátis
  - versão de teste
- Aws Lambda
  - 1 milhão de requests por mês grátis
  - 
- Amazon S3
  - gratuito por 12 meses até 5GB
- lightsail
  -1 mês para até 750 horas uso

Questionário

### Conceitos de definição de preço da AWS
- page somente pelo que usar
- pague menos ao fazer reserva
- pague menos com descontos baseados em volume, quando usar mais
- calculadora de preço da AWS

### Painel de cobrança
Painel de faturamento da AWS (Billing)

- Compare o saldo atual do mês acumulado com o mês anterior e obtenha uma previsão do próximo mês com base no uso atual.
- Visualize os gastos do mês acumulado por serviço.
- Visualize o uso do nível gratuito por serviço.
- Acesse o Cost Explorer e crie orçamentos.
- Adquira e gerencie o Savings Plans.
- Publique AWS relatório de uso e custo(opens in a new tab).

### Cobrança consolidada
- cobrança consolidada (todas contas numa única conta) com cobranças e descontos
- visualizar de forma detalhada
- desconto por volume
- instâncias reservadas podem ser compartilhadas entre contas da organização

### AWS Budgets
- definir orçamentos personalidados
- envia alerta quando chega numa porcentagem definida

### AWS Cost Explorer
- permite analisar visualmente os seus gastos
- detalhamento dos gastos por serviço nos último 6 meses

### Planos do AWS Support
- AWs basic suport plan
  - 
- AWs developer support plan
  - suporte basic
  - acesso por e-mail ao suporte ao cliente
  - AWs trusted Advisor limitado
- AWs business support plan
  - suporte basic e developer
  - trusted adivisor total
  - acesso direto a engenheiros de suporte por telefone
  - gerenciamento de evento de Infraestrutura (black friday por exemplo)
- AWs enterprise on-ramp support plan
  - suporte basic, developer e business
  - tempo de resposta de 30 minutos
  - acesso a TAMs (Technical Account Manager): orientação pro ativa
- AWs Enteprise support plan
  - Suporte basic, developer e business
  - tempo de resposta de 15 minutos
  - acesso a TAMs (Technical Account Manager)

O seis pilares do Well-Architect:
- excelência operacional
- segurança
- confiabilidade
- eficiência de Desempenho
- otimização de recursos
- sustentabilidade

Questionário

### AWS Marketplace
- catálogo digital de produtos e solução
- ferramentas de gerenciamento de custos

### Resumo do módulo 8
- Três ofertas do nível gratuito da AWS: 12 meses grátis, sempre gratuito e versão de teste
- Benefícios da cobrança consolidada no AWS Organizations
- Ferramentas para planejamento, estimativa e revisão de custos da AWS
- Diferenças entre os cinco planos do AWS Support: Basic, Desenvolvedor, Empresarial, Empresarial Rápido e Empresarial de Grande Porte
- Como descobrir um software no AWS Marketplace

### Questionário do módulo 8

## Módulo 09: Migração e inovação
### Introdução ao módulo 9

### AWS Cloud Adoption Framework (AWS CAF)
- Negócios: analista comercial ou negócios
- Pessoas: RH
- Governança
- Platforma: arquiteto de nuvem
- Segurança
- Operações

Questionário

### Estratégias de migração
6 Rs:
- redifinir a hospedagem: também conhecido como “lift-and-shift”) envolve a movimentação de aplicações sem alterações. 
- redefinir a plataforma: (também conhecido como “lift, tinker and shift”) envolve fazer algumas otimizações na nuvem para obter um benefício tangível.
- retirar: é o processo de remoção de aplicações que não são mais necessários.
- reter
- recomprar
- refatorar:  (também conhecida como rearquitetura) envolve reimaginar como uma aplicação é arquitetada e desenvolvida usando recursos nativos da nuvem.

Questionário

### AWS Snow Family
- AWS Snowcone
  - 8TB
- AWS Snowball edge
  - 80TB
  - Snowball Edge Storage Optimized 
  - Snowball Edge Compute Optimized
- AWS Snowmobile
  - 100 petabytes

Questionário

### Inovação com a AWS
- VMWarware
- AWS Sagemaker: modelos de machine learning
- Amazon Augmented AI Amazon Augmented AI ou Amazon A2I
- Amazon Lex: chatbots de voz e texto 
- Amazon text extract
- AWS DeepRacer: aprendizado por reforço
- AWs Ground Station: satélite

- amazon Code Whizperer: IA para gerar código fonte em linguagem de programação
  - avalia práticas de segurança
  - sugestões de código baseado nas escritas de código
  - acelera desenvolvimento de software

### Resumo do módulo 9
- O AWS Cloud Adoption Framework
- As seis estratégias para migração
- A AWS Snow Family
- Inovação com serviços da AWS

### Questionário do módulo 9

## Módulo 10: Jornada para a nuvem
### Introdução ao módulo 10
- Resumir os seis pilares do Well-Architected Framework.  
- Explicar os seis benefícios da computação em nuvem.

Well-Architected Framework que são:  
- excelência operacional
- segurança
- confiabilidade
- eficiência de performance
- otimização de custos 
- sustentabilidade

### O AWS Well-Architected Framework
- excelência operacional: automatizar atualização utilizando pipelines de deploy
- segurança: processos para garantir a integridade dos dados e trabalhar com criptografia
- confiabilidade: caso uma instância EC2 se torne indisponível  e como lidar com isso de acordo com as suas necessidades de negócio e demandas de clientes.
- eficiência de performance: utilização inteligente dos recursos.  Por exemplo, utilizar uma instância EC2 que esteja de acordo com seu tipo de workload.
- otimização de custos : ficar de olho nas suas instâncias EC2 para não correr o risco de estar usando uma instância  verticalmente muito grande de forma desnecessária
- sustentabilidade: minimizar os impactos ambientais da execução de workloads na nuvem.  Redução do consumo de energia e ampliação da eficiência são as principais áreas deste pilar

Questionário

### Benefícios da nuvem AWS
- Seis principais benefícios da AWS
  - custo variável, pagar pelo que utilizar
  - benefício de economia de escala massiva
  - parar de adivinhar a capacidade
  - aumente a velociadade e agilidade
    - criar e excluir recursos rapidamente
  - parar de gastar dinheiro com execução e manutenção de datacenters
  - alcance global em minutos

Questionário

### Resumo do módulo 10
Os seis pilares do AWS Well-Architected Framework:
- Excelência operacional
- Segurança
- Confiabilidade
- Eficiência de desempenho
- Otimização de custos
- Sustentabilidade

Seis vantagens da computação em nuvem:
- Trocar despesas iniciais por despesas variáveis.
- Benefícios das grandes economias de escala.
- Parar de adivinhar capacidade.
- Aumentar a velocidade e agilidade.
- Parar de gastar dinheiro com execução e manutenção de data centers.
- Ter alcance global em minutos.

### Questionário do módulo 10
