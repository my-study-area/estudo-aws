# stepfunction-eventbridge-glue

## Prompts

<details>
  <summary>Prompt inicial</summary>

  # Objetivo
  Criar arquivos terraform para criaçao de recursos aws que cria um agendamento para executar um job glue.

  # Contexto
  - Tenho a ideia inicial do projeto no arquivo planejamento.md
  - avaliar o arquivo para um entendimento inicial

  # Instrução
  - ler planejamento
  - criar arquivos terraform para:
    + criação de glue simples, somente um log e demais recursos necessários
    + criação de step function para execução do glue
    + agendamento eventbridge com recorrência a cada 5 minutos
    + validar recursos com terraform init e validate

  # Saída
  Arquivos terraform para os recursos



  1. arquivo separado
  2. variável

  criar os arquivos numa pasta chamada infra
</details>
