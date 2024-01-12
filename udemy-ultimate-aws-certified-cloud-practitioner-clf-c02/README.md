# [NEW] Ultimate AWS Certified Cloud Practitioner CLF-C02

## Section 1 - Introduction


## Section 2 - Code & Slides Download

## Section 3 - What is cloud computing?
9. The difference type of cloud computing

Types od cloud computing:
- Infrastructure as a Service (IaaS)
- Platform as a Service (PaaS)
- Software as a Service (SaaS)

Pricing for cloud computing:
- Computer: pay for compute
- Storage: pay for data storage in the cloud
- Data transfer OUT of the Cloud: when the data leaves the cloud. Data transfer IN is free



## Section 4 - IAM - Identity and Access Management
14. IAM Introduction: Users, Groups, Policies

- IAM is a global service
- Root account created by default, shouldn’t be used or shared

15. IAM Users & Groups Hands On

Practice on create a user in AWS Console


16. IAM Policies 

Let's say you want to create a policy that allows read-only access to an S3 bucket named "example-bucket":

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::example-bucket",
            "Principal": {
                "AWS": "arn:aws:iam::123456789012:user/username"
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::example-bucket/*",
            "Principal": {
                "AWS": "arn:aws:iam::123456789012:user/username"
            }
        }
    ]
}
```

Explanation:

- "Version": Specifies the version of the policy language.
- "Statement": Contains an array of statements, each representing a set of permissions.
- "Effect": Specifies whether the action is allowed or denied. In this case, it's set to "Allow".
- "Action": Indicates the specific action or actions that are allowed. For example, s3:GetObject allows retrieving objects from the bucket, and s3:ListBucket allows listing objects within the bucket.
- "Resource": Specifies the ARN (Amazon Resource Name) of the resource to which the permissions apply. In this case, it allows access to the "example-bucket".
- "Principal": specifies the IAM user to which the permissions apply. Replace "arn:aws:iam::123456789012:user/username" with the ARN of the IAM user you want to grant permissions to.

This policy grants the specified IAM user ("arn:aws:iam::123456789012:user/username") permission to list the bucket, get its location, retrieve, upload, and delete objects within the "example-bucket" S3 bucket.


18. IAM MFA Overview

19. IAM MFA Hands On

20. AWS Access Keys, CLI and SDK

21. AWS CLI Setup on Windows

22. AWS CLI Setup on Mac

23. AWS CLI Setup on Linux

24. AWS CLI Hands On

25. AWS CloudShell

26. IAM Roles for AWS Services

IAM Roles for Services 

- Some AWS service will need to perform actions on your behalf
- To do so, we will assign permissions to AWS services with IAM Roles
- Common roles: 
  - EC2 Instance Roles 
  - Lambda Function Roles 
  - Roles for CloudFormation

27. IAM Roles Hands On

28. IAM Security Tools

IAM Security Tools

- IAM Credentials Report (account-level)
  - a report that lists all your account's users and the status of their various credentials
- IAM Access Advisor (user-level)
  - Access advisor shows the service permissions granted to a user and when those services were last accessed.
  - You can use this information to revise your policies.

30. IAM Best Practices
- Don’t use the root account except for AWS account setup
- One physical user = One AWS user
- Assign users to groups and assign permissions to groups
- Create a strong password policy
- Use and enforce the use of Multi Factor Authentication (MFA)
- Create and use Roles for giving permissions to AWS services
- Use Access Keys for Programmatic Access (CLI / SDK)
- Audit permissions of your account using IAM Credentials Report & IAM Access Advisor
- Never share IAM users & Access Keys

31. Shared Responsibility Model for IAM

AWS

- Infrastructure (global
network security)
- Configuration and
vulnerability analysis
- Compliance validation

You

- Users, Groups, Roles, Policies
management and monitoring
- Enable MFA on all accounts
- Rotate all your keys often
- Use IAM tools to apply
appropriate permissions
- Analyze access patterns &
review permissions 

32. IAM Summary
- Users: mapped to a physical user, has a password for AWS Console
- Groups: contains users only
- Policies: JSON document that outlines permissions for users or groups
- Roles: for EC2 instances or AWS services
- Security: MFA + Password Policy
- AWS CLI: manage your AWS services using the command-line
- AWS SDK: manage your AWS services using a programming language
- Access Keys: access AWS using the CLI or SDK
- Audit: IAM Credential Reports & IAM Access Advisor

Quiz 2: Identity and Access Management Quiz


## Section 5: EC2 - Elastic Compute Cloud
33. AWS Budget Setup

34. EC2 Basics

Amazon EC2

- EC2 = Elastic Compute Cloud = Infrastructure as a Service
- It mainly consists in the capability of :
  - Renting virtual machines (EC2)
  - Storing data on virtual drives (EBS)
  - Distributing load across machines (ELB)
  - Scaling the services using an auto-scaling group (ASG)
- Knowing EC2 is fundamental to understand how the Cloud works

EC2 sizing & configuration options 

- Operating System (OS): Linux, Windows or Mac OS 
- How much compute power & cores (CPU) 
- How much random-access memory (RAM) 
- How much storage space: 
  - Network-attached (EBS & EFS) 
  - hardware (EC2 Instance Store) 
- Network card: speed of the card, Public IP address 
- Firewall rules: security group 
- Bootstrap script (configure at first launch): EC2 User Data 

EC2 User Data
- It is possible to bootstrap our instances using an EC2 User data script.
- bootstrapping means launching commands when a machine starts
- That script is only run once at the instance first start
- EC2 user data is used to automate boot tasks such as:
  - Installing updates
  - Installing software
  - Downloading common files from the internet
  - Anything you can think of
- The EC2 User Data Script runs with the root user

35. Create an EC2 Instance with EC2 User Data to have a Website Hands On

36. EC2 Instance Types Basics

EC2 Instance Types - Overview
- You can use different types of EC2 instances that are optimised for different use cases (https://aws.amazon.com/ec2/instance-types/)
- AWS has the following naming convention:

m5.2xlarge

- m: instance class
- 5: generation (AWS improves them over time)
- 2xlarge: size within the instance class

EC2 Instance Types – General Purpose

- Great for a diversity of workloads such as web servers or code repositories
- Balance between:
  - Compute
  - Memory
  - Networking
- In the course, we will be using the t2.micro which is a General Purpose EC2 instance

EC2 Instance Types – Compute Optimized

- Great for compute-intensive tasks that require high performance processors:
  - Batch processing workloads
  - Media transcoding
  - High performance web servers
  - High performance computing (HPC)
  - Scientific modeling & machine learning
  - Dedicated gaming servers

EC2 Instance Types – Memory Optimized

- Fast performance for workloads that process large data sets in memory
- Use cases:
  - High performance, relational/non-relational databases
  - Distributed web scale cache stores
  - In-memory databases optimized for BI (business intelligence)
  - Applications performing real-time processing of big unstructured data

EC2 Instance Types – Storage Optimized

- Great for storage-intensive tasks that require high, sequential read and write
access to large data sets on local storage
- Use cases:
  - High frequency online transaction processing (OLTP) systems
  - Relational & NoSQL databases
  - Cache for in-memory databases (for example, Redis)
  - Data warehousing applications
  - Distributed file systems


37. Security Groups & Classic Ports Overview
