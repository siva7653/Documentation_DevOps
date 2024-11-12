## Explain the load balancers:

    Application Load Balancer (ALB): Best for HTTP and HTTPS traffic, operates at the application layer (Layer 7).
    Network Load Balancer (NLB): Best for TCP traffic, operates at the transport layer (Layer 4).
    Classic Load Balancer (CLB): Operates at both the request level and connection level (Layer 4 and Layer 7), suitable for older applications.
    Q: How do you set up an Application Load Balancer (ALB)?
    A: To set up an ALB, go to the AWS Management Console, navigate to the EC2 dashboard, and select "Load Balancers" under "Load Balancing." Click "Create Load Balancer," choose "Application Load Balancer," and follow the prompts to configure listeners, target groups, and other settings.

## Explain the CI/CD pipeline
    Developer write the code in local system and push the code to central repo
    when ever push the code the ci/cd pipeline trigger automatically
    trigger the pipeline done the maven test if test cases is passed then going to build the package.
    the package is done going to scan the code to analyze the quality of code, security vulanrabilities and potential bugs.
    the code scanning done and report is given as per our requirement. 
    then go to build the docker image.
    when it create the docker image then it will push the image to ecr repo
    the complete ci is completed then deloy to environmet like stage/ uat/ prev/ prod

## what is EBS (Elastic Block Store) where we can use it.
    EBS is a persistent block storage service that provides high-performance storage for EC2 instances. Unlike instance store volumes, which are temporary and ephemeral, EBS volumes persist beyond instance termination and can be attached to different instances.

## How do you create and attach an EBS volume to an EC2 instance?
    To create an EBS volume, go to the EC2 dashboard, select "Volumes" under "Elastic Block Store," and click "Create Volume." Specify the size, type, and availability zone. To attach it to an instance, select the volume, click "Actions," and choose "Attach Volume," then select the instance.

## Explain about VPC
    VPC is a logically isolated network that you define in AWS. It allows you to control your own virtual network, including IP address ranges, subnets, route tables, and network gateways.
    It's used to securely connect and manage resources within AWS resources.

    Types Default VPC and Custom VPC.
    
    Types of Subnets:
    Public Subnet: A subnet that has a route to the internet through an Internet Gateway (IGW). 
                    Resources in a public subnet can directly access the internet.
    Private Subnet: A subnet that does not have a direct route to the internet.
                    Resources in a private subnet typically use a NAT Gateway or NAT Instance to access the internet.


## Explain about S3 bucket?
    S3 means simple storage service
    storing and retrieving any amount of data from anywhere on the web. It is commonly used for a wide variety of applications, including data backup and archiving, content storage and distribution, big data analytics, and more.
    An S3 bucket is a container for storing objects. Each bucket is identified by a unique name and is associated with a specific AWS Region.
    Buckets serve as the top-level namespace for storing data in S3.
    ----------------
## How do you ensure data durability in AWS S3?
    Replication: Automatically replicates data across multiple AZs within a region.
    Versioning: Keeps multiple versions of an object, so you can recover from accidental deletions or overwrites.
    Cross-Region Replication (CRR): Optionally replicate data to a different AWS region for additional durability and disaster recovery.


## SQS (Simple Queue Service)
    SQS is highly scalable and can handle any volume of messages, providing consistent and low-latency performance.
    SQS is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. You use it to send, store, and receive messages between software components at any volume.

## What is the difference between scalability and elasticity?
    Scalability refers to the system’s ability to handle increased load by adding resources. It can be either vertical (adding more power to an existing instance) or horizontal (adding more instances).
    Elasticity refers to the system’s ability to automatically adjust its resources based on current demand. It ensures that resources are scaled up or down dynamically to match the workload, optimizing cost and performance.

## How can you achieve high availability in AWS?

    Multi-AZ Deployments: Distribute resources across multiple Availability Zones (AZs) to ensure redundancy and fault tolerance.
    Elastic Load Balancing (ELB): Use ELBs to distribute traffic across multiple instances and AZs.
    Auto Scaling: Automatically adjust the number of instances based on traffic and load.
    Amazon RDS Multi-AZ: Deploy databases in multiple AZs to ensure automatic failover and data redundancy.

## What are the best practices for designing fault-tolerant systems on AWS?
    Use Multiple AZs: Distribute your instances across multiple AZs to avoid single points of failure.
    Implement Backup and Recovery: Regularly back up your data and test your recovery procedures.
    Monitor and Automate: Use AWS CloudWatch to monitor your infrastructure and set up alarms to trigger automated responses.
    Use Managed Services: Leverage AWS managed services like RDS and S3, which come with built-in fault tolerance and high availability features.

## How does AWS Auto Scaling work, and how do you configure it?
    AWS Auto Scaling helps maintain application performance and availability by automatically adjusting the number of EC2 instances in response to changing demand. To configure it:

    Create an Auto Scaling Group (ASG): Define the minimum and maximum number of instances, and specify the launch configuration or launch template.
    Define Scaling Policies: Set up policies based on CloudWatch metrics (e.g., CPU utilization) to scale in or out.
    Use Scheduled Actions: Automatically adjust the number of instances based on predefined schedules.


## What is AWS CloudFormation, and how can it be used to deploy scalable systems?
    A CloudFormation stack is a collection of AWS resources that you can manage as a single unit. All resources in a stack are defined by the stack’s CloudFormation template. You can create, update, and delete a collection of resources by managing the stack itself rather than individual resources.
    iam using cloud formation stack to create the EKS cluster
        cloud formation stack we can use json and yaml file formats.
        
        In this stack we have mention stack name | Cluster Name | Resources like VPC, subnets, internet gate way,
            and attached internet gateway to vpn | Route Table | Route table attach with Internet Gate way|
            Cluster Security Group attach with vpn | EKS cluster details | EKS Cluster Roles |Cluster Security Group

## How do you resolve a CloudFormation stack failure?
    Review Events: Check the CloudFormation Events tab to get details about which resource failed and why.
    Inspect Logs: Look at the logs of any AWS services involved to identify errors.
    Check Resource Limits: Ensure that the stack does not exceed AWS resource limits or quotas.
    Validate Template: Use the aws cloudformation validate-template command to check for syntax errors in the template.
    Update Stack: If a resource is in an unstable state, consider updating or rolling back the stack to a stable state.
    Dependency Issues: Verify that all dependencies (e.g., IAM roles, security groups) are correctly configured and available.

## What are security groups and how do they work?
    Security groups are virtual firewalls that control inbound and outbound traffic to AWS resources. They work at the instance level and are stateful, meaning if you allow an incoming request from an IP, the response is automatically allowed. Security groups are associated with EC2 instances, and you can define rules based on IP protocol, port number, and source/destination IP addresses or CIDR blocks.

## What is the difference between a security group and a network ACL?
    Security Group: Operates at the instance level and is stateful. It allows you to define inbound and outbound rules. Changes to security groups are applied immediately.
    Network ACL (NACL): Operates at the subnet level and is stateless. It allows you to define rules for inbound and outbound traffic separately. NACLs are evaluated in order and apply to all instances within the subnet.

## How do you handle network traffic for a VPC?
    Route Tables: Direct traffic between subnets and to/from the internet.
    Security Groups: Control access at the instance level.
    Network ACLs: Provide an additional layer of security at the subnet level.
    NAT Gateways/Instances: Allow private subnets to access the internet while remaining private.


## How do you monitor and troubleshoot network issues in AWS?
    Use Amazon CloudWatch: Monitor metrics and logs related to network traffic.
    Check VPC Flow Logs: Capture information about the IP traffic going to and from network interfaces in the VPC.
    Inspect Route Tables and Security Groups: Ensure proper configuration for routing and access control.
    Utilize AWS Trusted Advisor: Get recommendations and best practices for network configurations.

## What are IAM Policies in AWS, and how do they contribute to security?
    Identity and Access Management
    permissions for users, groups, or roles.
    These policies specify what actions are allowed or denied on specific AWS resources.
    IAM policies help ensure that only authorized users can perform certain actions, providing a way to manage access control effectively.

    Managed Policies: These are standalone policies that you can attach to multiple users, groups, or roles in your AWS account. AWS provides two types:

        AWS Managed Policies: Created and managed by AWS, these policies are designed to provide permissions for common use cases.

        Customer Managed Policies: Created and managed by you, these policies provide more granular control and can be customized to meet specific requirements.

    Inline Policies: These are policies that you create and manage directly within a single user, group, or role. 
    Inline policies maintain a strict one-to-one relationship between the entity and the policy.


## What is AWS Glue, and what are its main components?

    AWS Glue is a fully managed ETL (Extract, Transform, Load) service that makes it easy to prepare and load data for analytics. Its main components are:
    Glue Data Catalog: A central repository to store metadata and data schemas.
    Glue Crawler: Scans data in various sources to infer schemas and populate the Data Catalog.
    Glue ETL Jobs: Scripts that extract data from sources, transform it, and load it into the target data store.
    Glue Dev Endpoint: Provides a development environment to create and test ETL scripts.

## What is a Glue Crawler, and how does it work?
    A Glue Crawler is a component that connects to your data source, extracts metadata like table definitions, schema, and data types, and then stores this information in the Glue Data Catalog. Crawlers can automatically detect and catalog different data formats (e.g., CSV, Parquet, JSON) and update the catalog when data changes.

## How do you create a Glue ETL job, and what are the options for authoring the job?
    A Glue ETL job can be created using the AWS Glue Console, AWS SDK, or AWS CLI. There are two main options for authoring the job:
    Script Authoring: Write custom Python or Scala code using Glue’s pre-built libraries.
    Visual ETL: Use the Glue Studio, which provides a visual interface to build ETL workflows without writing code.

## How does AWS Glue handle schema evolution?
    AWS Glue supports schema evolution by automatically updating the Glue Data Catalog when data structures change. If a Glue Crawler detects new fields or changes in the schema, it can add them to the existing table definition without interrupting the ETL process.

## How do you create a DataBrew project, and what are the key steps involved?
    To create a DataBrew project:
    Select a dataset from S3, Redshift, or other supported data sources.
    Create a new project by specifying the dataset and naming the project.
    Use the visual interface to explore, clean, and transform the data using built-in transformations and recipes.
    Save the transformations as a recipe that can be applied to other datasets.

## What are DataBrew Recipes, and how do they work?
    DataBrew Recipes are a series of steps or transformations that are applied to a dataset to clean or prepare it. Each recipe consists of one or more actions such as filtering, splitting, joining, or transforming data. Recipes can be reused across multiple datasets, enabling consistent data preparation.

## Can you explain how DataBrew handles data quality and profiling?
    DataBrew provides built-in data profiling features that automatically assess the quality of data by identifying issues such as missing values, duplicates, and outliers. It generates a detailed data profile report that provides insights into the data's structure, distribution, and potential quality issues.

## How does DataBrew integrate with other AWS services?
    AWS DataBrew integrates with services like:
    S3: For data storage and access.
    Redshift: For accessing and transforming data stored in Redshift clusters.
    Glue Data Catalog: For using the schema information stored in the Glue Data Catalog.
    AWS Lake Formation: For fine-grained access control to data stored in the data lake.

## What types of data transformations can you perform with AWS DataBrew?
    AWS DataBrew offers a wide range of transformations, including:
    Cleaning Operations: Removing duplicates, filling missing values, handling outliers.
    String Operations: Splitting, merging, trimming, replacing.
    Date and Time Operations: Parsing, formatting, and adjusting date/time values.
    Aggregations: Grouping, summing, averaging.
    Enrichment: Adding calculated columns, applying conditional logic.

## How do you ensure data security and compliance when using AWS Glue and DataBrew?
    IAM Policies: Applying least-privilege access using IAM roles and policies.
    Data Encryption: Enabling encryption at rest using KMS keys and in-transit using SSL/TLS.
    VPC Endpoints: Using VPC endpoints to securely connect to data sources.
    Monitoring and Auditing: Enabling logging and monitoring with CloudTrail and CloudWatch to track data access and job execution.
