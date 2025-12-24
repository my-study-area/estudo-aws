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


Aqui estão os tópicos da **Section 5**, abrangendo as aulas de 40 a 60, conforme as imagens fornecidas:

## Section 5: Amazon S3 and CloudFront
### 40. Introduction


### 41. Amazon Simple Storage Service (S3)
- bucket is a container for objects
- as object is a file upload
- key: object name
- bucket name must be unique in all aws


### 42. Amazon S3 Storage Classes
- durability
- availability



### 43. [HOL] Working with S3 Buckets and Objects



### 44. IAM Policies, Bucket Policies and ACLs
- iam polices:
  - iam policies are identity-based policies
  - specify what actions are allowed on what aws resource
- bucket resources:
  - are rexource-based pólicies
  - can only be attached to amazon s3 Buckets
  - also use the aws access policy language
- S3 Access Control Lists (ACLs)
  - AWS generally recommends using S3 bucket policies or IAM policies rather than ACLs
  - Can be attached to a bucket or directly to an object
  - Limited options for grantees and permissions
- When to use each access control mechanism
- **Use IAM policies if:**
  - You need to control access to AWS services other than S3
  - You have numerous S3 buckets each with different permissions requirements (IAM policies will be easier to manage)
  - You prefer to keep access control policies in the IAM environment
- **Use S3 bucket policies if:**
  - You want a simple way to grant cross-account access to your S3 environment, without using IAM roles
  - Your IAM policies are reaching the size limits
  - You prefer to keep access control policies in the S3 environment


### 45. [HOL] S3 Permissions and Bucket Policies
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-s3/permissions-lesson/identity-policy.json
- link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-s3/permissions-lesson/bucket-policy.json
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-s3/permissions-lesson/identity-policy-deny.json



### 46. S3 Versioning, Replication and Lifecycle Rules
- s3 version: many variants of an object in the same bucket
- replication: SRR (same region replication) and CRR (cross region replication)
- lifecycle rules


### 47. [HOL] Configure Replication and Lifecycle
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-s3/s3-trust-policy.json
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-s3/s3-replication-permissions.json


### 48. MFA with Amazon S3
- s3 multi-factor authentication delete
  - Adds MFA requirement for bucket owners to the following operations:
    - Changing the versioning state of a bucket
    - Permanently deleting an object version
  - The **x-amz-mfa** request header must be included in the above requests
  - The second factor is a token generated by a hardware device or software program
  - Requires **versioning** to be enabled on the bucket
  - **Versioning** can be enabled by:
    - Bucket owners (root account)
    - AWS account that created the bucket
    - Authorized IAM users
  - **MFA delete** can be enabled by:
    - Bucket owner (root account)

- MFA-Protected API Access
  - Used to enforce another authentication factor (MFA code) when accessing AWS resources (not just S3)
  - Enforced using the **aws:MultiFactorAuthAge** key in a bucket policy:
  - Denies any API operation that is not authenticated using MFA

```json
{
  "Version": "2012-10-17",
  "Id": "123",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::examplebucket/securedocuments/*",
      "Condition": { "Null": { "aws:MultiFactorAuthAge": true }}
    }
  ]
}
```

### 49. Amazon S3 Encryption
- SSS-S3: server side encryption with s3 managed key
- SSE-KMS: server side encryption with aws kms managed keys
- SSE-C: server side encryption with client provided keys (SSE-C)
- client-side encryption



### 50. [HOL] Enforce Encryption with AWS KMS
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-s3/s3-enforce-kms-encryption.json



### 51. [HOL] S3 Event Notifications
- send enotifications when events happen in buckets
  - sns
  - sqs
  - lambda functions


### 52. [HOL] S3 Presigned URLs



### 53. Server Access Logging
- Provides detailed records for the requests that are made to a bucket
- Details include the requester, bucket name, request time, request action, response status, and error code (if applicable)
- Disabled by default
- Only pay for the storage space used
- Must configure a separate bucket as the destination (can specify a prefix)
- Must grant write permissions to the Amazon S3 Log Delivery group on destination bucket


### 54. Cross-Origin Resource Sharing (CORS)
- allow requests from an origin to another origin
- origin is defined by DNS name, protocol, and port

- CORS with Amazon S3
  - Enabled through setting:
    - Access-Control-Allow-Origin
    - Access-Control-Allow-Methods
    - Access-Control-Allow-Headers
  - These settings are defined using rules
  - Rules are added using JSON files in S3

```json
[
  {
    "AllowedHeaders": [
      "*"
    ],
    "AllowedMethods": [
      "PUT",
      "POST",
      "DELETE"
    ],
    "AllowedOrigins": [
      "http://www.mycompany.com"
    ],
    "ExposeHeaders": []
  }
]
```


### 55. Amazon S3 Performance Optimization
- to increase uploads over long distances, use Amazon S3 Transfer Acceleration
- combine s3 and ec2 in the same aws region
- use caching services to cache the latest content:
  - amazon cloudfront (CDN)
  - amazon Elaticache (in memory cache)


### 56. Amazon CloudFront Origins and Distributions
- origin (Amazon S3 or Amaon EC2)
- content is pushed from origin and cached in edge location
- there are many edge location around the world
- users are directed to the nearest edge location

**CloudFront Web Distribution:**
* Speed up distribution of static and dynamic content, for example, .html, .css, .php, and graphics files
* Distribute media files using HTTP or HTTPS
* Add, update, or delete objects, and submit data from web forms
* Use live streaming to stream an event in real time


### 57. CloudFront Signed URLs and OAI/OAC
- OAI (origin access identity)
- OAC (origin access control)

Recurso,O que ele faz?,Quando usar?

Signed URL,Autoriza o Usuário Final,Para arquivos individuais e temporários.
OAI (Legacy),Autoriza o CloudFront no S3,Apenas em arquiteturas antigas ou regiões velhas.
OAC (New),Autoriza o CloudFront no S3,Sempre. É a recomendação atual da AWS.



### 58. [HOL] CloudFront Cache and Behavior Settings
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-cloudfront/cloudfront-cache-and-behavior.md


### 59. Amazon Route 53 DNS
| Routing Policy | What it does |
| :--- | :--- |
| **Simple** | Simple DNS response providing the IP address associated with a name |
| **Failover** | If primary is down (based on health checks), routes to secondary destination |
| **Geolocation** | Uses geographic location you're in (e.g. Europe) to route you to the closest region |
| **Geoproximity** | Routes you to the closest region within a geographic area |
| **Latency** | Directs you based on the lowest latency route to resources |
| **Multivalue answer** | Returns several IP addresses and functions as a basic load balancer |
| **Weighted** | Uses the relative weights assigned to resources to determine which to route to |



### 60. Exam Cram - S3 and CloudFront


### Quiz 2: Amazon S3 and CloudFront




