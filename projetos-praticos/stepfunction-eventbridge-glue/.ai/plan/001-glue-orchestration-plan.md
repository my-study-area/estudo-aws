Olá! Entendo perfeitamente a sua frustração. Erros de descriptografia (`KMS Decrypt`) ao usar o **EventBridge Scheduler** integrado com **KMS** e **Step Functions** são extremamente comuns e costumam acontecer por pequenos detalhes nas permissões.

Como o nosso objetivo aqui é didático e focado em resolver problemas de programação/infraestrutura de forma clara, vou explicar detalhadamente onde o erro costuma estar e como corrigi-lo.

---

## O Diagnóstico: Onde está o erro?

Quando o EventBridge Scheduler é configurado para disparar um destino (como a sua State Machine do Step Functions) usando uma chave KMS personalizada, o fluxo funciona assim:

1. O payload ou as configurações do agendamento são **criptografados** usando o KMS no momento da criação do agendamento.
2. Na hora da execução (a cada 5 minutos), o EventBridge Scheduler assume a **Role de Execução do Scheduler** (`scheduler_role`).
3. Com essa Role, ele tenta chamar o serviço do KMS para **descriptografar** (`kms:Decrypt`) as informações antes de invocar o Step Functions.

Se ocorrer um erro de descriptografia, ele quase sempre se deve a **um (ou ambos) destes dois motivos**:

### Motivo 1: A Role de Execução do Scheduler não tem permissão de Decrypt no KMS

A IAM Role que o Scheduler assume precisa ter explicitamente a permissão de usar a chave KMS para descriptografar os dados.

### Motivo 2: A Política da Chave KMS (Key Policy) bloqueia a Role

As chaves KMS são altamente protegidas. Mesmo que a IAM Role do Scheduler diga "eu posso usar o KMS", a **Key Policy** (a política anexada diretamente à chave KMS) precisa dizer explicitamente "eu permito que esta IAM Role do Scheduler use esta chave".

---

## Como corrigir isso no Terraform

Abaixo, apresento o trecho de código corrigido e focado nas políticas de segurança para garantir que a descriptografia ocorra com sucesso.

### 1. Ajustando a Política da Chave KMS (KMS Key Policy)

A política da chave KMS deve permitir explicitamente que a **Role do Scheduler** realize as operações criptográficas:

```hcl
resource "aws_kms_key" "scheduler_kms" {
  description             = "Chave KMS para criptografia do EventBridge Scheduler"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # 1. Permissão administrativa total para a conta (padrão do KMS)
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      },
      # 2. Permissão específica para a ROLE do Scheduler usar esta chave
      {
        Sid    = "AllowSchedulerRoleToUseKey"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.scheduler_role.arn # Vincula diretamente à Role criada abaixo
        }
        Action = [
          "kms:Decrypt",
          "kms:DescribeKey",
          "kms:GenerateDataKey*"
        ]
        Resource = "*"
      }
    ]
  })
}

```

### 2. Garantindo as permissões na Role de Execução do Scheduler

A Role que o Scheduler assume para rodar o agendamento precisa ter uma política IAM que lhe dê acesso à chave KMS:

```hcl
# Política IAM anexada à scheduler_role
resource "aws_iam_policy" "scheduler_policy" {
  name        = "scheduler-trigger-sfn-policy"
  description = "Permite disparar o Step Function e descriptografar dados via KMS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # Permissão para disparar o Step Functions
      {
        Effect = "Allow"
        Action = [
          "states:StartExecution"
        ]
        Resource = aws_sfn_state_machine.glue_orchestrator.arn
      },
      # Permissão ESSENCIAL para descriptografar usando a chave KMS criada
      {
        Effect = "Allow"
        Action = [
          "kms:Decrypt",
          "kms:DescribeKey",
          "kms:GenerateDataKey*"
        ]
        Resource = aws_kms_key.scheduler_kms.arn
      }
    ]
  })
}

```

---

## Passos para implementar a correção

Se você já possui o Terraform aplicado e está enfrentando o erro, siga estes passos para atualizar a sua infraestrutura com segurança:

1. **Substitua as políticas:** Atualize o seu arquivo `.tf` com as permissões mútuas exibidas acima (onde a Role do Scheduler aponta para o KMS e a Política do KMS aponta de volta para a Role do Scheduler).
2. **Ciclo de dependência (Atenção):** No Terraform, referenciar a Role dentro da Política do KMS e a Chave KMS dentro da Role pode gerar um ciclo de dependência (*cycle error*). Para evitar isso, nós declaramos a política da chave KMS diretamente no bloco `aws_kms_key` utilizando a referência `aws_iam_role.scheduler_role.arn`. O Terraform gerencia essa ordem de criação perfeitamente.
3. **Execute o comando de atualização:**
```bash
terraform plan
terraform apply

```


4. **Validação:** Aguarde o próximo ciclo de 5 minutos do EventBridge Scheduler e verifique no painel do Step Functions se uma nova execução foi iniciada com sucesso.

Se precisar de ajuda para analisar os detalhes de algum log de erro específico que apareceu no seu console, ou queira ajustar outra parte do código, estou por aqui para ajudar!
