# [2025] Ace your AWS Certified Developer Exam with this AWS
Link: https://www.udemy.com/course/aws-certified-developer-associate-exam-training/

## Section 1: Let's Get Started!

### 1.  Welcome and How to Use this Course


### 2.  The DVA-C02 Exam
- Time: 130 minutes
- format: 65 questions
- domain development:
  - develop code for applications hosted on AWS
  - develop code for AWS lambda
  - use data sores in applications
  - identify components and resources for security
- domain security:
  - implement authentication and authorization
  - implement encryption
  - manage sensitive data
- domain deployment
  - prepare application application
  - test application 
  - automate deployment testing
  - deploy code by using CI/CD
- domain troubleshooting and optimization
  - root cause analysis
  - instrument code for observability
  - optimize applications

### 3.  Hands-On Practice: Free Tier vs Sandbox
A comparation between them

### 4.  Course Download
- Code: https://github.com/forks-projects/aws-dva-code
- Slides: [link](./AWS+Certified+Developer+Associate+Slides.pdf)
- Exam: [link](./Exam+Cram+DVA-C02.pdf)
- Plan: [link](./AWS+Certified+Developer+Associate+Study+Plan.pdf)


## Section 2: AWS Accounts and IAM
### 5. Introduction


### 6. AWS Account Overview
- account root user
- AWS IAM (user, group, role, policy)


### 7. [HOL] Create your AWS Account
- free plan (11 months)
  - select aws service and features
  - acoocunt expires after 6 months
- paid plan


### 8. [HOL] Configure Account and Create a Budget
- configure account alias (email+account1@email.com)
- go to iam service
- create an alias for the account
- in left > Billing preferences
- go to budgets service. Create a budget using a template. Put the emails recupients
- user has no permission by default


### 9. AWS Identity and Access Management (IAM)
- console, CLI and API (SDK) are used by principal.
- Principal is a person or applicattion that can make a requwst for na action or operation on an aws resource.
- user group have user, user groups, role and policy


### 10. [HOL] Creating IAM Users and Groups
- step by step to create a user group and user
- creates a admin user group with full access: AsministratorAccess policy
- create a user to use aws cconsole and adds the admin user group created before


### 11. IAM Authentication and MFA
Step by step to create a user and add to a group.


### 12. [HOL] Setup Multi-Factor Authentication (MFA)
- aws console: username and password
- cli or api: access key id and secret access key
- phisical or virtual MFA


### 13. AWS Security Token Service (STS)
- sts: temporary credential

The source explains the function and operational mechanics of the AWS Security Token Service (STS), which is responsible for issuing short-lived or temporary security credentials across the platform. It outlines a common use case where an EC2 instance requiring access to an S3 bucket must first assume an IAM role via the STS Assume Role API call. This assumption process is managed by two policy types: a permissions policy, which defines allowed actions, and a crucial trust policy, which strictly controls who is authorized to assume the role. Upon successful assumption, STS issues the required temporary security credentials—including an access key, secret key, and session token—to enable the authorized access. These credentials are designed to expire quickly but are renewed automatically by STS, making the service essential for scenarios such as cross-account access and Identity Federation.


### 14. Access Control Methods - RBAC & ABAC
- RBAC: role-based access control
  - policies are attached to groups
- ABAC: attribute-based access control
  - use attribute like tags to apply polices

### 15. [HOL] Switching IAM Roles
- go to ima service > user > group 
- create a default user, without groups (don't define password in the next login)
- go to ec2 and can't view elastic ips and load balancers
- create a new roles (amazonEC2FullAccess policy). Name the role with ec2-role

```json
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "arn:aws:iam::975050181034:role/ec2-role"
  }
}
```
fonte: https://github.com/forks-projects/aws-dva-code/blob/main/aws-iam/sts-assume-role.json



## Section 3: AWS Command Line Interface (CLI)
### 16. Introduction
CLI: Command line interface


### 17. [HOL] Install the AWS Command Line Interface (CLI)
Step by step to install aws cli.


### 18. [HOL] Configure Credentials for the AWS CLI
```bash
aws configure
cat .aws/config
cat .aws/credentials
```

### 19. [HOL] Overview of Using the AWS CLI
```bash
aws help

aws ec2 help

aws ec2 describe-instances

aws s3 help

aws s3 mb s3://mytestbucket1234qwer

aws s3 ls

touch testfile.txt

aws s3 cp testfile.txt s3:/mytestbucket1234qwer

aws s3 ls

aws s3 rb s3://mytestbucket1234qwer

aws s3 ls
```


### 20. [HOL] Assuming IAM Roles (CLI)
- go to paul user in IAM and remove the polices
- go to ec2-full-access role. Copy the arn and past in the code bellow:


```
# ~/.aws/config
[profile ec2-full-access]
    role_arn = arn:aws:iam::821711655051:role/EC2-Full-Access
    source_profile = default
```

```bash
aws ec2 describe-instances

aws ec2 describe-instances --profile ec2-full-access

aws configure --profile Neal

aws s3 ls --profile Neal
```
