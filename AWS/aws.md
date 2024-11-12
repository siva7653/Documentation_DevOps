## IAM Role cretation:
    go and search in console aws bar type iam
    in the IAM we have the option called "Create role"
    in that we have Trusted entity like
        AWS Service
        AWS Account
        Web identity
        SAML 2.0 federation
        custom trust policy
    we have selected the "AWS service"
    in the below we have a use case like no of services
    which service we have to use this role for perticular service like ec2, eks, lambda, cloud formation e.t.c
    so we can select the "EKS-cluster" in the use case.

    click "Next"

    In the permission policy we have add and update the permission policy

    click "Next"

    give the Name and Description and "create role" button

------------------------------------------
## Amazon EKS Cluster
---------------------------------
## what are the main components of eks and how they work together and manage contanirazed application
   control plane 
           -control plane manage the over all cluster including nodes,pods,service
           -it is responsible for managing pods,secudling pods and providing api for manageing cluster
    worker nodes 
           -worker nodes are the physical or virtual machines that can run on containarized applications.
           -they are the responsible for pulling container images,running containers,providing network for connectivity for pods
    kubernates api
           -kubernates api is primary interface for managing eks cluster
           -api allows create,update,delete resources in your cluster

## different options available for networking amazon eks cluster
    amazon vpc
            -it is default vpc for eks cluster
            -it allows you isolate your cluster in pravate vpc and control network access to pods,services
    aws pravte link
            -it is connectivy betwwen eks cluster and amazon aws like s3,dynamo db,rds 
            -with out exposing your cluster trafic to plublic network
    calico 
            -An open-source networking solution that provides advanced networking features for EKS clusters, such as network policy enforcement and network policy automation.

## how to use aws iam roles to manage aws resources for eks pods and service
     iam roles allows specific permissions to acess pods,service to access aws resource like s3,dynamobd,sns topic 
     for giving above permission pods,service can access easily with out giving extra permissions

## how to configure and manage logging and monitoring for amazon eks cluster clould watch
     we use logging and monitoring health and performance in eks cluster
     we collect logs from your nodes and pods. as well as metrics about their performance using clould watch
     we can use these three also for monitoring and logging CloudTrail and Amazon Kinesis, Firehose

## implement security policies 
     pod security policy
                   limits and access control rules for pods to restrict their behavior and prevent unauthorized access
     network policy
                   network policies to control traffic between pods and external resources, preventing unauthorized communication and protecting your cluster from network-based attacks
     image scanning 
                   scanning tools to identify vulnerabilities in container images before deployment, reducing the risk of security breaches

## Troubleshooting EKS clusters involves identifying the root cause of the issue
    checking logs and events
                    checking logs and evets for nodes and service control plance provide correct cause for issue
    another tools 
                   kubectl and clould watch get information about issue
## manage autoscaling for Amazon EKS clusters using Amazon Cluster Autoscaler and other autoscaling strategies
   -eks cluster has right number of worker nodes to meet work loads demands
   -amazon cluster automatically adjust number of worker nodes based on cpu and memory utilization 
   -you can use autoscaler for kubernates horizontal pod auto scaler

## how to levarage amazon eks serverless applications using aws fargate
   -AWS Fargate is a service that lets you run containers without worrying about managing servers.
   - You just tell Fargate what your container needs, and it handles all the details, like starting,     stopping, and scaling the resources automatically
## how to monitering and troubleshoot performance eks cluster 
   -monitering and troubleshoot performance in eks cluster using tools like prometheus tool
    -we get all these
      -gathering metrics
      -analyzing logs
      -identifying root cause of performance degradation

## how to prepare and respond for to security incident in amazon eks cluster including incident responce plans ,security incident and event mangement tools 
   protecting eks cluster from cyberattacks for security incident we can use SIEM tools

## essential components of eks cluster 
   -vpc with approprite subnets
   -security groups for cluster and nodes 
   -iam roles for eks control plane and nodes
   -eks control plane and nodes
   -worker nodes (ec2 instance or forgate)

## eks cluster confirgation
    -aws-auth is config map is used to map iam roles to kubernates Role-Based Access Control.
    -aws-auth is allowing control access to eks cluster

## what are managed node groups in eks cluster
    -managed node groups allows manage ec2 instance life cycle in eks cluster automatically

## what is service mesh and how it is used in eks
   
   service mesh is provide advanced networking features like load balancing,trafic management and observability between services running in an EKS cluster

## how to deploy applications on eks
    application deploy on eks manifest files (yaml files), helm charts or kubernates tools like kubectl

## how to upgrade eks cluster
   eks cluster upgrade control plane and nodes separately

## In an Amazon EKS (Elastic Kubernetes Service) cluster, the backend consists of several components and services that work together to manage and orchestrate your containerized applications.
   1.kubernates control plane 
     API Server -api server process restful request and validate them and updates the corresponding     objects in kubernates data stored (etcd)

     etcd- a key-value store that stores critical data for the cluster, it stores important imformation about nodes and pods,configmaps,secrets

     schedular -A scheduler watches for newly created Pods that have no Node assigned. For every Pod that the scheduler discovers, the scheduler becomes responsible for finding the best Node for that Pod to run on.

     he Kubernetes Controller Manager, or kube-controller-manager, is a daemon that monitors and manages the state of a Kubernetes cluster.

## Commands
    1.Cluster Interaction and Context commands
       --kubectl config get-contexts (list of all the contexts clusters that your kubectl configurqation)
       --kubectl config use-context <context-name> (Switches kubectl to use a different context (cluster))
   -   -kubectl cluster-info (Displays the address and status of the Kubernetes master and DNS services.)
   
    2. pods commands
       --kubectl get pods (list of all pods)
       --kubectl describe pod <pod-name> (information about pods including events,state,logs)
       --kubectl logs <pod-name> (Fetches the logs of a specific pod)
       --kubectl exec -it <pod-name> -- /bin/bash (Opens an interactive shell session inside a running pod.)

    3. Services commands
       --kubectl get svc (Lists all services in the current namespace.)
       --kubectl describe svc <service-name>(get the information about specific service)

    4.  Deployments commands
        --kubectl get deployments (list of all deployments name spaces )
        --kubectl describe deployment <deployment-name> (get the information about specific service)
        --kubectl rollout status deployment/<deployment-name>(shows rollout status deployment when you   deploy new changes )
        --kubectl scale deployment <deployment-name> --replicas=<number>(Scales the deployment to the specified number of replicas)
        --kubectl rollout undo deployment/<deployment-name> (Rolls back the last deployment update)

    5.  Namespaces commands
        --kubectl get namespaces(Lists all namespaces in the cluster.)
        --kubectl create namespace <namespace-name>(Creates a new namespace.)
        --kubectl delete namespace <namespace-name>(Deletes a specific namespace and all resources within it)

    6.  ConfigMaps and Secrets commands
        --kubectl get configmaps(Lists all ConfigMaps in the current namespace)
        --kubectl describe configmap <configmap-name>(Provides detailed information about a specific ConfigMap.)
        --kubectl get secrets(Lists all secrets in the current namespace)
        --kubectl describe secret <secret-name>(Provides detailed information about a specific secret)

    7. Nodes commands
       --kubectl get nodes(Lists all nodes in the cluster)
       --kubectl describe node <node-name>(Shows detailed information about a specific node, including resource utilization and conditions.)

    8.  Configurations and Files commands
       --kubectl apply -f <file.yaml>(Applies or updates resources defined in a YAML file.)
       --kubectl delete -f <file.yaml>(Deletes resources defined in a YAML file)

    9.  Troubleshooting
       --kubectl get events(Displays the events from the cluster, which are helpful for troubleshooting issues)
       --kubectl top pods and kubectl top nodes(Shows the current CPU and memory usage of pods and nodes, respectively)
       --kubectl describe <resource> <name>(Provides detailed information about any Kubernetes resource (e.g., pods, services, deployments), including events and error messages)

       --kubectl version (Displays the version information of kubectl and the Kubernetes cluster)
       --kubectl edit <resource> <name> (Opens the configuration of a Kubernetes resource in an editor, allowing you to make live changes.)
    





------------------------------
## AWS EKS
-------XXX---------------
------------------------------
## AWS ELK
------------------------------
## What are the basic components of Elasticsearch?
Answer:

Node: A single instance of Elasticsearch running on a machine.
Cluster: A group of one or more nodes that hold data and perform indexing and search functions.
Index: A collection of documents that are logically related.
Document: A unit of information stored in an index, expressed in JSON format.
Shards: Indexes can be split into multiple pieces called shards to distribute the load across nodes.
Replicas: Duplicates of shards used for fault tolerance and high availability.

## How can you scale Elasticsearch?
Answer: You can scale Elasticsearch in the following ways:

Vertical scaling: Increase the resources (CPU, memory) of individual nodes.
Horizontal scaling: Add more nodes to the cluster to handle more data or queries.
Sharding: Split indices into multiple shards to distribute data across different nodes.
Replication: Increase the number of replica shards to enhance availability and distribute query load.

## What is the difference between grok and kv filters in Logstash?
Answer:

Grok filter: Extracts structured data from unstructured log messages using patterns. It's mainly used for parsing logs and extracting meaningful fields.
KV filter: Splits log data into key-value pairs, typically used when logs are formatted as key-value pairs, making it easier to break them down into fields.

## What is a rolling restart in Elasticsearch?
Answer: A rolling restart is the process of restarting nodes in an Elasticsearch cluster one by one, without bringing down the entire cluster. It allows you to perform maintenance or upgrade nodes while keeping the cluster available. During a rolling restart, the data is served by the remaining nodes, ensuring that there is no downtime.
-----------------------------
## AWS ELK
-------XXX---------------


## Cloud Formation creation:

## AWS Services:

## AWS Lambda

## AWS IAM
--------------------------
## AWS S3 
-----------------------------
    S3 means Simple Storage Service.
    It is used for scalable object storage service.
    S3 bucket is container store objects like files and metedata.
    each bucket maintained by unque name.
    Store data 0 to 5TB
## Different types of storage classes
    S3 Standard: 
                Genaral purpouse storage
    S3 Standard In Frequent Access:
                For data accessed less frequently but requires rapid access when needed.
    S3 one gone access in frequent access: 
                For stored in single availbility gone.
    S3 Glaciour: 
                For long time achiver with low cost. with retrive the data from mint to hours.
    S3 Glaciour Deep Archive: 
                The lowest cost for storing the data but they rearly accessed with retrive time will be 12 hours or more time
    S3 Intelligent Tiering: 
                Automattically moved data between two access tiers frequent and infrequent when access patren change.

## How can you secure data in S3 buckets
    using
        Bucket Policies
        IAM Policies (Identity and Access Managemnet)
        Bucket ACLs (Access Control List) : Grant Permission of read and write access for users and groups. 
        MFA Multi Factor Authendication
        Encription 
        Block Public Access

## S3 Glacier Valuts and Archives?
    Valuts: Valuts are containers used to organize and store archives (like buket in s3)
    Archives: Archive are invidual files are data stored with in the valut.
            Each Archive have a unique id.  

## concept of S3 Lifecycle policies
    move the data from s3 to s3 galciour for reduce the storage cost.  

## Cross-Region Replication in S3
    Cross-Region replication allows you to replicate data from one region to other regions.
    This is very usefull for disaster recovery purpouse.

## monitor S3 usage and performance
    we can use for monitor S3 usage and performance using AWS CloudWatch for metrics like data transfer, request rates, and bucket size.

## Snow ball
    this is for transfer large amount of data into and out of aws.
    use cases:
    Data Migartion:
            moving the datasets to cloud when network banwith is limited. 
    Disaster Recovery:
            Quickly transfering large datasets to a secure location in aws.
    Edge Computing:
            edge computing involves processing the data closer where its generated to reduce the latency and band width usage.

------------
AWS S3 Bucket
-----------XXX-----------------
------------------------------
## AWS Aurora
------------------------------  

## AWS Cloud Watch
    AWS CloudWatch is a service that keeps an eye on the AWS resources you use and the AWS apps you run. 
    It can automatically set alarms, track and collect metrics, and respond to changes in your AWS resources.
    
    Amazon CloudWatch is a management service tool designed for system architects, developers, and administrators to monitor their Amazon web services applications in the cloud in near-real time. Due to the high level of competition, strong technical skills are required.

    AWS CloudWatch is a monitoring service for AWS-hosted applications and AWS cloud resources. When it comes to AWS CloudWatch, it's important to be able to monitor processors, logs, and metrics.

    — CloudWatch Alarms are used to monitor metrics and trigger actions when a threshold is breached, such as sending notifications or performing automated remediation.
    
    — CloudWatch Events are used for event-driven automation and integration. They capture events from AWS services and custom applications and can trigger actions based on those events. Alarms are typically used for metric-based monitoring, while Events are used for event-driven actions.


AWS ECS (Elastic Container Service) with AWS Fargate
AWS EKB (Elastic Container Service For Kubernetes)
AWS EB (Elastic Beanstalk) with single container docker

## Types of clusters:
         An AWS (Amazon Web Services) cluster refers to a collection of instances (virtual servers) and services that work together to run applications, manage workloads, or perform various computing tasks. Clusters in AWS can be set up using different services depending on the specific use case and requirements.
         
## Load Balancer:
        We have three types of load balancers.
        1. Application Load Balancer
        2. Network Load Balancer
        3. Gateway Load Balancer

        In "Application Load Balancer" distributes incoming application traffic across multiple targets,
        such as EC2 instances, in multiple Availability Zones. 
        This increases the availability of your application. 
        we can add more listeners to your load balancer.
        the process is after load balancer reciving the request. it evaluate the lisner rules in the priority order.
        checking which rule will be apply. and then select the target from target group from rule action.
        we can configure the lisners rules to route request to different target groups based on the content of application tarffic.
![alt text](<4a copy.jpg>)


## AWS pushing Docker Image to ECR Repo and Deploying to ECS Cluster (manual process)
    Go ECR Repo

    Create Repository
    Private
    Repository Name
    -->Create Repository

    Open the Repository
    --> View push commands
        like login ecr login
        build the image
        tag the image
        push the image
        
    Go to ECS
    --> Cluster
    Create cluster
        cluster name
        Infrastructure
            AWS Fargate
            Ec2 instance
        Monitoring
        Encryption
        Tags
    --> Create
    Task definitions
        create new task definition
        create new task definition with json

        create new task definition
            task definition name
            Infrastructure requirements
                AWS Fargate
            Container
                name
                Image uri
                Port Mapping
            Storage
            Monitoring
            Tags
    --> create
    Go to task definition
        Deploy --> Run task
        Create
            Environment
            Deployment Configuration
            Networking
            Task overrides
            Container overrides
            Tags
            

                
        
        
            
                
        
        