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

## Section 4: Amazon VPC, EC2, and ELB
### 21. Introduction
- VPC
- load balancer
- EC2
- auto scaling
- ELB


### 22. Amazon VPC, Security Groups, and NACLs
- VPC: logic isolate
  - public and private subnets
  - router
  - internet gateway
  - nat instance (managed by you)
  - nat gateway (managed by aws)
  - ACLs


### 23. Amazon EC2 Overview
- ENI (elastic network interface): to connect the ec2 instances
- ecs instances families & types: general purpose, compute optimized, memory optimized e etc
- EBS



### 24. [HOL] Create a Custom VPC
- vpc: 10.0.0.0/16
  - public: us-east-1a/ 10.0.1.0/24
  - public: us-east-1b/ 10.0.2.0/24
  - private a: 10.0.3.0/24
  - private b: 10.0.4.0/24
- route table
  - 10.0.0.0/16 local
  - 0.0.0.0/0 igw-id
- private route-RT
  - 10.0.0.0/16 local
- internet gateway: 
  - vpc: myvpc
  - public route
    - 0.0.0.0/0 -> IG
- public subnet A and B: Enable auto-assign public IPv4 address
- EC2
  - vpc: MyVPV
  - public subnet 
  - AZ: us-east-1b/a

Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-vpc/custom-vpc.md


### 25. Amazon EBS and Instance Stores
- EBS volumes: persistent storage
- instance store (phisically attached): ephemeral


### 26. [HOL] Create and Attach an EBS Volume
- https://github.com/forks-projects/aws-dva-code/blob/main/amazon-ebs/amazon-ebs-volumes.md


### 27. Amazon Elastic File System (EFS)
- regional file system
- EFS support linux only


### 28. [HOL] Create an Amazon EFS Filesystem
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-efs/working-with-efs.md



### 29. Amazon EC2 User Data and Metadata
- data about your instance
- IMDS: instance metadata service
  - IMDSv1
  - IMDSv2
- amazon ec2 user data: batch and powershell script that run on start
  - user data only runs the first time you launch your instance

### 30. [HOL] Using User Data and Metadata
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-ec2/user-data-metadata.md


### 31. Access Keys and IAM Roles with EC2
Access Keys and IAM Roles are two distinct methods for supplying permissions to Amazon EC2 instances, such as granting access to an S3 bucket. Access Keys are long-term credentials associated with an IAM user account and configured on the instance, but they are stored in plain text, presenting a significant security risk if they are compromised. To avoid this security exposure, IAM Roles can be utilized; they have policies assigned to them and allow the instance to gain the required permissions without storing any credentials locally. The instance assumes the role and leverages the AWS Security Token Service (STS) to obtain credentials that are short-term and have a much shorter expiration period. Since the instance automatically renegotiates for new credentials before the old ones expire, utilizing IAM Roles is the preferred and more secure option compared to storing long-term access keys



### 32. [HOL] Practice with Access Keys and IAM Roles
- shows how the advantages of using access key instead IAM roles
- always use IAM roles


### 33. Amazon EC2 Auto Scaling
- automatically launche abd terminates instances
- maintain availability and scale capacity
- working with ec2, ecs and eks
- integrated with many services like coloudwatch for monitoring and elastic load balance for distributing connections


### 34. [HOL] Create an Auto Scaling Group
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-ec2/user-data-web-server.sh

- create an ec2 launch template
- crate an auto scaling group and use the template created bafore


### 35. Amazon Elastic Load Balancing
- provide high availability and fault tolerance
- application load balancer: layer 7 (HTTP/HTTPS)
- network load balancer: layer 4 TCP and UDP
- gateway load balancer: deploy, scale and manage 3rd party virtual netowork appliances



### 36. [HOL] Create an Application Load Balancer



### 37. [HOL] Create a Scaling Policy
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-ec2/generate-load-on-alb.md
```bash
for i in {1..200}; do curl http://your-alb-address.com & done; wait
```


### 38. [HOL] Create ASG and ALB using the AWS CLI
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-ec2/create-asg-alb-cli.md



### 39. Exam Cram - VPC - EC2 - ELB



### Quiz 1: Amazon VPC, EC2, and ELB


