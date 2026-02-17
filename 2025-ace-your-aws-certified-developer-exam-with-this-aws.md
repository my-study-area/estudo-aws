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




## Section 6: Infrastructure as Code and PaaS

### 61. Introduction
- cloudformation
- elastic Beanstalk


### 62. Infrastructure as Code with AWS CloudFormation
- template file using code (yml or json  file)
- template
- stacks
- stacksets
- change sets


### 63. [HOL] Creating and Updating Stacks
- https://github.com/forks-projects/aws-dva-code/blob/main/aws-cloudformation/1-ec2-template.yml
- https://github.com/forks-projects/aws-dva-code/blob/main/aws-cloudformation/2-ec2-template.yml
- https://github.com/forks-projects/aws-dva-code/blob/main/aws-cloudformation/3-ec2-template.yml


### 64. [HOL] Create Nested Stack using the AWS CLI
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-cloudformation/Create%20Nested%20Stack%20using%20the%20AWS%20CLI.md



### 65. CloudFormation Template Deep Dive



### 66. [HOL] Complex VPC Stack
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-cloudformation/create-vpc-with-cloudformation.yaml



### 66. Platform as a Service with AWS Elastic Beanstalk
- IAAS
- PAAS (Elastic Beanstalk)



### 68. [HOL] Create an Elastic Beanstalk Application



### 69. Advanced Configuration and SSL/TLS
- configuration files for Aws Elastic Beanstalk is .ebextensions
- connections between clients and load balancer are secured
- backend connections between the load balancer and ec2 are not secured
- you can configure the certificate throutgh the console or throught .ebextensions


### 70. Exam Cram - Infrastructure as Code and PaaS



### Quiz 3: Infrastructure as Code and PaaS


## Section 7: AWS Lambda and AWS SAM
### 71. Introduction


### 72. Serverless Services and Event-Driven Architecture
- serverless services there are no instances to manage
- you don't need to provision hardware
- there is no management of operating systems or software
- provides automatic scaling and high availability


### 73. AWS Lambda
- milisecond billing
- synchronous and assychronous


### 74. Invoking Lambda Functions
- Lambda functions can be invoked directly through:
  - The Lambda console
  - A function URL HTTP(S) endpoint
  - The Lambda API
  - An AWS SDK
  - The AWS CLI
  - AWS Toolkits


### 75. [HOL] Invoking Functions
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-lambda/invoking-functions.md




### 76. [HOL] Create Event Source Mapping
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-lambda/event-source-mapping.md



### 77. Lambda Versions and Aliases
- versioning means you have multiple version of your function
- MyFunction:$LATEST: alway run the latest version
- MyFunction:$1: alway run the first version
- each version has its own ARN


### 78. [HOL] Using Versions and Aliases
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-lambda/invoke-lambda-versions-aliases.md



### 79. Deployment Packages and Environment Variables
- deploy packages - zip archives
- deploy throught cloudformation
- lambda layer: additional code
- lambda environment


### 80. [HOL] Using Environment Variables
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-lambda/lambda-environ-test.md
- example using environment with and without KMS encription


### 81. Destinations and Dead-Letter Queues



### 82. [HOL] Destinations and DLQ
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-lambda/destinations-and-dlq.md
- the first example uses a destination and the second uses a DLQ



### 83. Reserved and Provisioned Concurrency



### 84. Monitoring, Logging, and Tracing



### 85. Lambda in a VPC and ALB Targets



### 86. Security for Lambda Functions



### 87. Best Practices for Developing with Lambda Functions
- Separate the Lambda handler from your core logic
- Take advantage of execution environment reuse to improve 
the performance of your function
- Use a keep-alive directive to maintain persistent connections
- Control the dependencies in your function's deployment package
- Minimize your deployment package size to its runtime necessitie
- Avoid using recursive code in your function


### 88. AWS Serverless Application Model (SAM)
- SAM (AWS Serverless Application Model)
- AWS SAM templates are an extension of AWS CloudFormation templates
- The “Transform” header indicates it’s a SAM template: `Transform: 'AWS::Serverless-2016-10-31'`


### 89. [HOL] Run SAM App Using CloudShell
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-lambda/sam-cli-commands.md



### 90. [HOL] The Serverless Application Repository
- SAR


### 91. Exam Cram - AWS Lambda and AWS SAM.mp4



### Quiz 4: AWS Lambda and AWS SAM


## Section 8: Amazon DynamoDB
### 92. Introduction



### 93. Amazon DynamoDB
- it is non-relational database
- can store key/value and document data types
- dynamoDB Acceleratior (DAX)
- basic components are:
  - Tables
  - Items
  - attributes


### 94. DynamoDB Partitions and Primary Keys
- there are two types od primary key: partition key and composite keys
- partition key: unique id for each item. partition key
- composite key:partition key + sort key comabination. Many itens with the same partition key
- cache: use DAX (DynamoDB Accelerator)


### 95. [HOL] Practice Creating DynamoDB Tables


### 96. DynamoDB Consistency Models and Transactions
- DynamoDB supports eventually consistent and strongly consistent reads
- Eventually consistent reads:
  - When you read data from a DynamoDB table, the response might not reflect the results of a recently completed write operation 
  - The response might include some stale data
  - If you repeat your read request after a short time, the response should return the latest data
- Strongly consistent read:
  - DynamoDB returns a response with the most up-to-date data, reflecting the updates from all prior write operations that were successful
- A strongly consistent read might not be available if there is a network delay or outage. In this case, DynamoDB may return a server error (HTTP 500)
- Strongly consistent reads may have higher latency than eventually consistent reads
- Strongly consistent reads are not supported on global secondary indexes
- Strongly consistent reads use more throughput capacity than eventually consistent reads



### 97. DynamoDB Capacity Units (RCU/WCU)
- RCUs (Ready capacity units)
- WCUs (Write capacity units)


### 98. DynamoDB Performance and Throttling
- Throttling occurs when the configured RCus or WCU are exceeded
- you may receive the folowing erro: ProvisionedThroughputExceededException


### 99. DynamoDB Scan and Query API
- scan and query API
- Scan: one by one, each item. Use `FilterExpression` to return fewe items. Projection Expression will return all post in such conditions
- Query: query operation finds items in you table based on the primary key attribute and a distinct value to search for. You can also use the ProjectionExpression parameter if you want 
the query to only return the attributes you want to see



### 100. [HOL] Searching DynamoDB - Scan API
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-dynamodb/DynamoDB%20CLI%20Commands.sh


### 101. [HOL] Searching DynamoDB - Query API
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-dynamodb/DynamoDB%20CLI%20Commands.sh


### 102. DynamoDB LSI and GSI
- LSI (Local secondary Indexes)
Provides an alternative sort key to use for scans 
and queries
  - Can create up to 5 LSIs per table
  - Must be created at table creation time
  - You cannot add, remove, or modify it later
  - It has the same partition key as your original table (different sort key)
  - Gives you a different view of your data, organized by alternative sort key
  - Any queries based on this sort key are much faster using the index than the main table

- GSI (Global Secondary Indexes)
  - Used to speed up queries on non-key attributes
  - You can create when you create your table or at any time
  - Can specify a different partition key as well as a different sort key
  - Gives a completely different view of the data
  - Speeds up any queries relating to this alternative partition and sort ke

### 103. [HOL] Create LSI and GSI



### 104. DynamoDB Optimistic Locking and Conditional Updates
- protect the consistency
- Optimistic locking is a strategy to ensure that the client-side item that you are updating (or deleting) is the same as the item in Amazon DynamoDB
- Protects database writes from being overwritten by the writes of others, and vice vers


- To manipulate data in an Amazon DynamoDB table, you use the PutItem, UpdateItem, and DeleteItem operations
- You can optionally specify a condition expression to determine which items should be modified
- If the condition expression evaluates to true, the operation succeeds; otherwise, the operation fail


### 105. [HOL] Adding a Time to Live (TTL) to Items
- https://www.epochconverter.com/ to converter in milisecond in a TTL
- enable TTL and add the name of the column


### 106. Amazon DynamoDB Streams


### 107. Amazon DynamoDB Accelerator (DAX)
- DAX (DynamoDB Accelerator)
- cache
- only read


### 108. Amazon DynamoDB Global Tables
 - DynamoDB global tables is a fully managed solution for deploying a multi-region, multi-master database
- When you create a global table, you specify the AWS Regions where you want the table to be available
- DynamoDB performs all the necessary tasks to create identical tables in these regions, and propagate ongoing data changes to all of them



### 109. [HOL] Enable Global Table


### 110. Exam Cram - Amazon DynamoDB


### Quiz 5: Amazon DynamoDB


## Section 9: Application Integration and APIs
### 111. Introduction
- API
- SQS
- SNS
- Amazon EventBridge
- Step Functions
- Amazon API Gateway (HTTP / REST)


### 112. Amazon Simple Queue Service (SQS)
- SQS is pull-based, not pushed-bses (like SNS)
- Default retentio is 4 days
- guarantees that your messages will be processed at least once
- standart queue does not guarantees the order of the messages
- fifo queues required message group id and message deduplication
- delay queue: delay the message for some seconds before to be ready for reading
- long polling vs short polling: SQS Long polling is a way to retrieve messages from SQS queues – waits for messages to arrive. SQS Short polling returns immediately (even if the message queue is empty)



### 113. [HOL] Working with SQS Queues
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-sqs/aws-sqs-cli-commands.md


### 114. Amazon SQS API and Client Library
ReceiveMessage
- Retrieves one or more messages (up to 10), from the specified queue
- Using the WaitTimeSeconds parameter enables long-poll support 

SendMessage
- DelaySeconds parameter delays a message
- MessageDeduplicationId parameter adds a deduplication ID (FIFO only)
- MessageGroupId parameter adds a tag for a message group (FIFO only)


### 115. Amazon Simple Notification Service (SNS)
- pub/sub messaging service



### 116. [HOL] Simple Serverless Application
- sns and sqs
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-sqs/lambda-code-sns-sqs.py



### 117. AWS Step Functions
- is used to build distributed applications as a series of steps in a visual workflow


### 118. [HOL] Create State Machine
- 


### 119. Amazon EventBridge



### 120. [HOL] Create Event Bus and Rule



### 121. Amazon API Gateway
- create and publish apis 
  - REST APIs
  - HTTP APIs: aws services, like aws lambda and HHTP endpoints
  - websocket APIs: such as lambda or dynamoDB



### 122. Methods, Integrations, and Mapping Templates
- a resource is a path in you api. Ex: "/" or "/pets" or "/pets/{petId}"
- method request: get, post, delete
- integration request: HTTP, HTTP_PROXY, LAMBDA_PROXY or MOCK
- endpoint (Lambda Function, HTTP endpoint, EC2 instance, AWS service)
- integration response: CONVERT PASSTHROUGH
- method response: HTTP_STATUS, CODES, RESPONSE, BODIES


### 123. API Gateway Stages and Deployments
- deployment
- stage
- stage variable



### 124. [HOL] Build an API with Lambda Proxy Integration
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-api-gateway/rest-api-lambda-proxy.py
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-api-gateway/url-commands-to-run.md


### 125. API Gateway Caching and Throttling
- caching endpoint's response
- clients canc invalidadte the cache with the header: `Cache-Control: max-age=0`


### 126. [HOL] Configure Caching and Throttling


### 127. API Gateway Usage Plans and API Keys
- users connect to specific public endpoint with API key that is configured in a usage plan
- A usage plan specifies who can access one or more deployed API stages and methods — and how much and how fast they can access them 
- You can use a usage plan to configure throttling and quota limits, which are enforced on individual client API keys 
- The plan uses API keys to identify API clients and meters access to the associated API stages for each key 
- It also lets you configure throttling limits and quota limits that are enforced on individual client API keys 
- You can use API keys together with usage plans or Lambda authorizers to control access to your API


### 128. [HOL] Usage Plans and API Keys



### 129. [HOL] Microservice with API, Lambda, and DynamoDB
Link: https://github.com/forks-projects/aws-dva-code/blob/main/amazon-api-gateway/api-lambda-dynamodb-hol.md



### 130. API Gateway Access Control
- resource-bsed policies
- identiy-based policies
- IAM tags
- Endpoint pokicies for interface VPC endpoints
- Lambda authorizers
- Amazon Cognito user pools


### 131. Exam Cram - Application Integration and APIs



### Quiz 6: Application Integration and APIs



## Section 10: Containers on Amazon ECS/EKS
### 132. Introduction
- ECS
- EKS
- ECR



### 133. Amazon Elastic Container Service (ECS)
- ECS Cluster: logical grouping
- task: is a running Docker container
- task definition: a task is created from a task definition
- image: Docker image can be stored in ECR
- service: are used to maintain a desired couint of tasks



### 134. Amazon ECS Launch Types
- EC2 launch type
- fargate launch type


### 135. Amazon ECS and IAM Roles
- EC2
  - the container instance IAM role provides permissions to the host
  - the ECS task IAM role provides permisssions to the container
- Fargate
  - with the fargate launch type only IAM task roles can be applied


### 136. ECS Task Placement Strategies
- ECS task Placement Strategies
- cluster query language


### 137. Scaling Amazon ECS
- service autoscaling
  - automatically adjusts the desired task count up or down using the application auto scaling service
  - supports targets trancking, step, and scheduled scaling policies
- cluster autoscale
  - uses a capacity povider to scale the number of EC2 cluster instances using EC2 auto scaling 


### 138. Amazon ECS with ALB



### 139. [HOL] Create an ECS Cluster with EC2 Launch Type



### 140. [HOL] Launch Task and Service with ALB



### 141. Amazon Elastic Container Registry (ECR)
- container images and artifacts are stored in S3


### 142. [HOL] AWS Fargate Blue-Green CI/CD Pipeline – Part 1
- Link: https://github.com/forks-projects/aws-dva-code/blob/main/fargate-blue-green-ci-cd/fargate-ci-cd-instructions.md


### 143. [HOL] AWS Fargate Blue-Green CI/CD Pipeline – Part 2
 - Link: https://github.com/forks-projects/aws-dva-code/blob/main/fargate-blue-green-ci-cd/taskdef.json
- 

### 144. [HOL] AWS Fargate Blue-Green CI/CD Pipeline – Part 3
- https://github.com/forks-projects/aws-dva-code/blob/main/fargate-blue-green-ci-cd/create-service.json



### 145. Amazon Elastic Kubernetes Service (EKS)
- amazon EKS auto scaling
- Amazon EKS and Elastic Load Balancing
- Amazon EKS Distro
- Amazon ECS and EKS Anywhere


### 146. AWS Copilot
Link: https://github.com/forks-projects/aws-dva-code/blob/main/aws-copilot/copilot-commands.md



### 147. Exam Cram - Containers on Amazon ECS - EKS



### Quiz 7: Containers on Amazon ECS/EKS

