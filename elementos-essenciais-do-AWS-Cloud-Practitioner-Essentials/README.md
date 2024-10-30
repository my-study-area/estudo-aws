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
