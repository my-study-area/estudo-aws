# 001 - Orquestração Glue com EventBridge Scheduler

## 1. Visão Geral
- **Objetivo**: Criar agendamento automático para executar Glue Job usando Step Functions
- **Serviços AWS**: Glue, Step Functions, EventBridge Scheduler, KMS, IAM
- **Padrão**: Agendamento recorrente a cada 5 minutos

## 2. Arquitetura

### Diagrama
```
EventBridge Scheduler (5min)
        ↓
Step Function (Orquestração)
        ↓
Glue Job (Execução)
        ↓
CloudWatch Logs (Saída)
```

### Fluxo
1. EventBridge Scheduler dispara a cada 5 minutos
2. Invoca Step Function com payload (nome do Glue Job)
3. Step Function inicia execução do Glue Job
4. Glue Job executa script Python (print de log)
5. Resultado registrado no CloudWatch

## 3. Recursos AWS

### 3.1 Glue
- **Database**: `glue_catalog_database`
- **Job**: `glue_job` com `glueetl` (Spark), Glue 4.0, Python 3.10
  - Worker: `G.1X` (4 vCPUs, 16 GB RAM)
  - Workers: `2` (mínimo para ETL)
- **Script**: `glue_script.py` (print simples)
- **S3 Bucket**: Bucket para armazenar scripts com versionamento habilitado

### 3.2 Step Function
- **State Machine**: Executa Glue Job via `glue:startJobRun.sync`
- **Estados**: RunGlueJob → Succeed

### 3.3 EventBridge Scheduler
- **Schedule**: `rate(5 minutes)`
- **Target**: Step Function
- **Group**: `glue-scheduler-group`

### 3.4 KMS
- **Chave**: Criptografia para dados sensíveis
- **Key Policy**: Permite Scheduler (Decrypt) e Conta (Admin)

### 3.5 IAM
- **Glue Role**: Acesso S3, CloudWatch, Glue
- **StepFunction Role**: Iniciar Glue Jobs
- **Scheduler Role**: Iniciar Step Functions + KMS Decrypt

## 4. Variáveis de Entrada

| Variável | Tipo | Padrão | Descrição |
|----------|------|--------|-----------|
| `aws_region` | string | `us-east-1` | Região AWS |
| `project_name` | string | `stepfunction-glue-eventbridge` | Nome do projeto |
| `environment` | string | `dev` | Ambiente (dev/stg/prd) |

## 5. Saídas (Outputs)

| Output | Descrição |
|--------|-----------|
| `glue_job_arn` | ARN do Glue Job |
| `step_function_arn` | ARN da Step Function |
| `scheduler_arn` | ARN do EventBridge Scheduler |
| `kms_key_arn` | ARN da chave KMS |
| `glue_scripts_bucket` | Bucket S3 dos scripts Glue |

## 6. Segurança

### 6.1 Princípio do Menor Privilégio
- Cada role tem apenas permissões necessárias
- KMS key policy com acesso restrito

### 6.2 Criptografia
- KMS para dados em trânsito e repouso
- Scheduler usa KMS para descriptografar payload

## 7. Validação

### 7.1 Comandos Terraform
```bash
cd infra
terraform init
terraform validate
terraform plan
```

### 7.2 Teste Pós-Deploy
1. Verificar execução automática a cada 5 minutos
2. Validar logs no CloudWatch
3. Conferir status no Step Functions console

## 8. Custos Estimados
- **Glue**: ~$0.88/hora (2x G.1X workers)
- **Step Function**: $0.025/1000 transições
- **EventBridge Scheduler**: Gratuito para primeiras 14.000 execuções/mês
- **KMS**: $1/chave/mês + $0.03/10.000 requests

## 9. Referências
- [AWS Glue Documentation](https://docs.aws.amazon.com/glue/)
- [Step Functions](https://docs.aws.amazon.com/step-functions/)
- [EventBridge Scheduler](https://docs.aws.amazon.com/eventbridge/latest/userguide/scheduler.html)
