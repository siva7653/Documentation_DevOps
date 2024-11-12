
"Hello! I'm Siva Vanga, working as DevOps Engineer at Ascendion. My recent focus has been on the Huron Education project, where I've played a role in ensuring smooth operations and effective deployments.

In my role, I've been responsible for managing code versions, orchestrating builds and releases across different environments like development, staging, and production. 

mostly iam working on service based roles:

In AWS services i have used like
S3 for storage, 
SNS for notifications, 
CloudWatch for alarms, and 
Load Balancer for distributing traffic. 
EKS -Elastic K8 Services
Node Groups
Security-wise, I've managed IAM and leveraged AWS Secrets Manager for securely storing credentials. 
Additionally, I've worked extensively with CloudFormation for stack creation and managing EC2 instances.

related tools like
docker:
kubernets:


I've set up automation pipelines in Azure, streamlining processes and scheduling tasks for seamless execution. 
In most of the pipelines, I frequently encounter version errors in builds. 
so i wanttTo address this, 
I created a stage for version checking before releases in other stages. 
This helps us easily to identify and resolve build version errors.
so iam updated in each and every release pipeline for updating this for easy to verify the versions.

and one more 
pipeline called "Audit Users."  
most of the time new user joined in the teams so we dont get any inforamtion related for this 
so we need to give the access on which perticular team we give the access.
so 
In this pipeline, I created a stage for comparing new users against existing users.
We maintain a repository named Project_UserData that contains folders for teams and permissions.
In this repository, I added a JSON file named after each team.

The pipeline compares the current Azure teams list with the JSON file list. If they match, the pipeline succeeds; 
otherwise, it throws an error and shows the differences in the team and team members list.
like that we have compared permission groups also. this is very usefull for my teams to handle the issues.

I have utilized Elasticsearch for creating custom dashboards to monitor key metrics across various applications.
PagerDuty has been instrumental in setting up alerts and notifications, ensuring swift response to any incidents.
Continuous improvement is a core focus—I regularly assess our tools and processes to enhance efficiency and response times.

and i have using automation tools like RunDeck, 
automating tasks such as file cleanup and managing build agents. 
if there any space error getting the ec2 instance we are running the rundeck job in perticular server to remove thelast 60 days releases and builds data.

I have developed scripts to audit permissions within our Azure DevOps setup.

In previous project i had working on k8.
    Through terraform i have created the EKS and node groups, nodes, loadbalancer,
    created pods of state full set 
    why statefull set means statefull set is scalling is done sequentialy and in order of deployment.
    if you want to decrease the replica sets delete the pods in last created one.
    that way we are using the stafull set mainly for our requirement based.
    helm chats for using the package of image and push the image to ecr repositories.
    and
    iam working in persistant valumes and persitant volume claims
    iam using persistant volume for pods and additionaly i am using the persistant volume claims 
    why means we attched and volume for the perticuler pods and we can detatch the pods also
    most of the time using this persistant volume claims some times pods is deleted and recreated the pods
    so the data will not collapse why if pods is delete the persistent volume claims not deleted that will detached only.
    and
    i have worked in resource Quota
    as per the requirement name space i am assign the quota of cpu and memory and pods like the requirement dependency.

Branching Startagy:
    master branch
    4 enviroment dev stage prev prod sand box
dev future deploy and test the env
future to devlop merge
develop brnch evn to sit(syst int test)
uat and uat 2
mr (merge request) uat (user acceptence test) and uat2 (if hot fix uat2)
after test
sign of the tests
prod deploy
sit

## Rundeck tool
Rundeck allows you to automate repetitive tasks, such as running scripts, deploying applications, or performing system maintenance. This saves time and reduces the risk
    In the rundeck job we are created one job of purge folder of last 60 days
    in this i have created job to run the purge folders in different ec2 instances. in dev enviroment
    In this rundeck we have to run the job in perticuler instance and group of instance also.


## AWS Cloud Watch:
    CloudWatch collects and tracks metrics (data points) for your AWS resources like EC2 instances, RDS databases, and more.
    Metrics include CPU usage, memory usage, disk activity, and network traffic.
    For example, you can create an alarm to alert you when the CPU usage of an EC2 instance exceeds 80%.

## ELK Stack:
    ELK Stack is a collection of three open-source tools used for searching, analyzing, and visualizing.
    ELK called as Elasticsearch| Logstash| kibana
    Logstash collects logs from various sources like servers, applications, and databases.
    It can also filter and transform the logs as needed.

## Rundeck:
    Rundeck is a tool for automating tasks and managing operations on your servers and IT infrastructure.
    Allows you to schedule and automate routine tasks.
    Keeps detailed logs of all job executions.
    Helps you track what happened, who did it, and when it was done.
    Sends notifications (e.g., email, Slack) when jobs start, succeed, or fail.

## AWS Load Balancer:
    Load Balances incoming traffic across multiple servers, known as targets, to ensure even distribution.
    Ensures that if one server fails, the traffic is automatically redirected to other healthy servers.
    Works with AWS Auto Scaling to automatically add or remove servers based on traffic load.
    Application Load Balancer (ALB):
    Operates at the application layer (Layer 7) and can make routing decisions based on content, such as URL paths.

    Network Load Balancer (NLB):
    Suitable for applications that require ultra-high performance and low latency.
    Operates at the transport layer (Layer 4) and can handle millions of requests per second.
    
    Classic Load Balancer (CLB):


## EBS: (Ealstic Block Storage)
    EBS provides block-level storage, which is similar to a traditional hard drive. You can format EBS volumes with a file system and use them like any other disk.
    You can create EBS volumes of various sizes, from 1 GB to 16 TB, and adjust the size as needed without losing data.
    EBS allows you to take point-in-time snapshots of your volumes. These snapshots can be used for backups, to create new volumes, or to migrate data.
    If needed, you can detach the volume from one instance and reattach it to another, making it easy to move data between instances.

## S3 (Simple Storage Service)
    Amazon S3 (Simple Storage Service) is a scalable, high-speed, web-based cloud storage service designed for storing and retrieving any amount of data at any time from anywhere.



------------------------------------------------------------------------
------------------------Azure--------------------------------------------
------------------------------------------------------------------------
## Azure CI CD
    CI/CD (Continuous Integration/Continuous Deployment) pipelines automate the process of software development, testing, and deployment. Azure DevOps provides a suite of tools to implement these pipelines.

    Code is stored in a version control system like Git, hosted on Azure Repos.
    A developer pushes code changes to the repository.
    The build pipeline compiles the code, runs tests, and creates build artifacts.

    After the build pipeline creates an artifact, the release pipeline picks it up.
    Specify which branches should trigger the release pipeline. For example, only builds from the main branch.
    Configure branch filters to ensure that only changes merged into main or release branches trigger the release.
    
    Link the release pipeline to the build pipeline, ensuring it always picks up the latest successful build artifact.
    like Deployment Automatically deploy the latest artifact to a development environment.
    Deploy to a staging environment.

    Upon successful testing, it’s promoted to staging, and finally, after approval, to deploy the production.


------------------------------------------------------------------------
------------------------Jenkins--------------------------------------------
------------------------------------------------------------------------
## Jenkins CI CD (Git Repository) latest version- 2.452.3v
https://github.com/iam-veeramalla/Jenkins-Zero-To-Hero/blob/main/Interview_Questions.md

1. Developers commit code changes to a Git repository hosted on GitHub.
2. Jenkins is triggered to build the code using Maven. Maven builds the code and runs unit tests.
3. Sonar is used to perform static code analysis to identify any code quality issues, security vulnerabilities, and bugs.
4. AppScan is used to perform a security scan on the application to identify any security vulnerabilities.
5. If the build and scans pass, Jenkins deploys the code to a development environment managed by Kubernetes.
6. Continuous Deployment: ArgoCD is used to manage continuous deployment. ArgoCD watches the Git repository and automatically deploys new changes to the development environment as soon as they are committed.

7. Promote to Production: When the code is ready for production, it is manually promoted using ArgoCD to the production environment.
8. Monitoring: The application is monitored for performance and availability using Kubernetes tools and other monitoring tools.

## What are the different ways to trigger jenkins pipelines ?
    - Poll SCM: Jenkins can periodically check the repository for changes and automatically build if changes are detected. 
              This can be configured in the "Build Triggers" section of a job.
              
    - Build Triggers: Jenkins can be configured to use the Git plugin, which allows you to specify a Git repository and     
            branch to build. 
            The plugin can be configured to automatically build when changes are pushed to the repository.
              
    - Webhooks: A webhook can be created in GitHub to notify Jenkins when changes are pushed to the repository. 
              Jenkins can then automatically build the updated code. This can be set up in the "Build Triggers" section of a job and in the GitHub repository settings.

## How to backup Jenkins ?
    There are multiple default and configured files and folders in Jenkins that you might want to backup.
    - Configuration: The `~/.jenkins` folder. You can use a tool like rsync to backup the entire directory to another location.
  
    - Plugins: Backup the plugins installed in Jenkins by copying the plugins directory located in JENKINS_HOME/plugins to another location.
    
    - Jobs: Backup the Jenkins jobs by copying the jobs directory located in JENKINS_HOME/jobs to another location.
    
    - User Content: If you have added any custom content, such as build artifacts, scripts, or job configurations, to the Jenkins environment, make sure to backup those as well.
    
    - Database Backup: If you are using a database to store information such as build results, you will need to backup the database separately. This typically involves using a database backup tool, such as mysqldump for MySQL, to export the data to another location.

    One can schedule the backups to occur regularly, such as daily or weekly, to ensure that you always have a recent copy of your Jenkins environment available. You can use tools such as cron or Windows Task Scheduler to automate the backup process.

## How do you store/secure/handle secrets in Jenkins ?
    there are multiple ways to achieve this, Let me give you a brief explanation of all the posible options.
    - Credentials Plugin: Jenkins provides a credentials plugin that can be used to store secrets such as passwords, API keys, and certificates. The secrets are encrypted and stored securely within Jenkins, and can be easily retrieved in build scripts or used in other plugins.
   
   - Environment Variables: Secrets can be stored as environment variables in Jenkins and referenced in build scripts. However, this method is less secure because environment variables are visible in the build logs.
   
   - Hashicorp Vault: Jenkins can be integrated with Hashicorp Vault, which is a secure secrets management tool. Vault can be used to store and manage sensitive information, and Jenkins can retrieve the secrets as needed for builds.
   
   - Third-party Secret Management Tools: Jenkins can also be integrated with third-party secret management tools such as AWS Secrets Manager, Google Cloud Key Management Service, and Azure Key Vault.

## What is latest version of Jenkins or which version of Jenkins are you using ?
    This is a very simple question interviewers ask to understand if you are actually using Jenkins day-to-day, so always be prepared for this.

## What is shared modules in Jenkins ?
    Shared modules in Jenkins refer to a collection of reusable code and resources that can be shared across multiple Jenkins jobs. This allows for easier maintenance, reduced duplication, and improved consistency across multiple build processes. For example, shared modules can be used in cases like:
    - Libraries: Custom Java libraries, shell scripts, and other resources that can be reused across multiple jobs.
        
    - Jenkinsfile: A shared Jenkinsfile can be used to define the build process for multiple jobs, reducing duplication and making it easier to manage the build process for multiple projects.
        
    - Plugins: Common plugins can be installed once as a shared module and reused across multiple jobs, reducing the overhead of managing plugins on individual jobs.
        
    - Global Variables: Shared global variables can be defined and used across multiple jobs, making it easier to manage common build parameters such as version numbers, artifact repositories, and environment variables.


## can you use Jenkins to build applications with multiple programming languages using different agents in different stages ?
    Yes, Jenkins can be used to build applications with multiple programming languages by using different build agents in different stages of the build process.
    
    Jenkins supports multiple build agents, which can be used to run build jobs on different platforms and with different configurations. By using different agents in different stages of the build process, you can build applications with multiple programming languages and ensure that the appropriate tools and libraries are available for each language.

    For example, you can use one agent for compiling Java code and another agent for building a Node.js application. The agents can be configured to use different operating systems, different versions of programming languages, and different libraries and tools.

    Jenkins also provides a wide range of plugins that can be used to support multiple programming languages and build tools, making it easy to integrate different parts of the build process and manage the dependencies required for each stage.

    Overall, Jenkins is a flexible and powerful tool that can be used to build applications with multiple programming languages and support different stages of the build process.

## How to setup auto-scaling group for Jenkins in AWS ?
    Here is a high-level overview of how to set up an autoscaling group for Jenkins in Amazon Web Services (AWS):
        - Launch EC2 instances: Create an Amazon Elastic Compute Cloud (EC2) instance with the desired configuration and install Jenkins on it. This instance will be used as the base image for the autoscaling group.
    
    - Create Launch Configuration: Create a launch configuration in AWS Auto Scaling that specifies the EC2 instance type, the base image (created in step 1), and any additional configuration settings such as storage, security groups, and key pairs.
    
    - Create Autoscaling Group: Create an autoscaling group in AWS Auto Scaling and specify the launch configuration created in step 2. Also, specify the desired number of instances, the minimum number of instances, and the maximum number of instances for the autoscaling group.
    
    - Configure Scaling Policy: Configure a scaling policy for the autoscaling group to determine when new instances should be added or removed from the group. This can be based on the average CPU utilization of the instances or other performance metrics.
    
    - Load Balancer: Create a load balancer in Amazon Elastic Load Balancer (ELB) and configure it to forward traffic to the autoscaling group.
    
    - Connect to Jenkins: Connect to the Jenkins instance using the load balancer endpoint or the public IP address of one of the instances in the autoscaling group.
    
    - Monitoring: Monitor the instances in the autoscaling group using Amazon CloudWatch to ensure that they are healthy and that the autoscaling policy is functioning as expected.

 By using an autoscaling group for Jenkins, you can ensure that you have the appropriate number of instances available to handle the load on your build processes, and that new instances can be added or removed automatically as needed. This helps to ensure the reliability and scalability of your Jenkins environment.

 ## How to add a new worker node in Jenkins ?
    Log into the Jenkins master and navigate to Manage Jenkins > Manage Nodes > New Node. Enter a name for the new node and select Permanent Agent. Configure SSH and click on Launch.

## How to add a new plugin in Jenkins ?
    Using the CLI, java -jar jenkins-cli.jar install-plugin <PLUGIN_NAME>

    Using the UI,

    Click on the "Manage Jenkins" link in the left-side menu.
    Click on the "Manage Plugins" link.

## What is JNLP and why is it used in Jenkins ?
    In Jenkins, JNLP is used to allow agents (also known as "slave nodes") to be launched and managed remotely by the Jenkins master instance. This allows Jenkins to distribute build tasks to multiple agents, providing scalability and improving performance.

    When a Jenkins agent is launched using JNLP, it connects to the Jenkins master and receives build tasks, which it then executes. The results of the build are then sent back to the master and displayed in the Jenkins user interface.

## What are some of the common plugins that you use in Jenkins ?
    you need to have atleast 3-4 on top of your head, so that interview feels you use jenkins on a day-to-day basis.
    maven
    docker



## what is tag & branch and difference between tag & branches ? (N)

Tag is in general its brand name it is one of static branch. Once you done create tag we can't change in codes files.
    It is symbol and does not takeup space in repository. Once tag is done we cant update same file. Usually use to mark versions.

Working developers to commit codes through branches only. It will merge previouse state and commit it again.
    whenever possible we can add and update the code lines and deployee n no of times.	

## what is difference between git fetch and git pull ? (N)

git fetch command for using to update files from remote repository to local repository but they can't merge in local working file.

git pull command for using to update files from remote repositories to local repositories but they can merge in local working file.

## What is the difference between Git revert and git reset ? (N)
Reverting undoes a commit by creating a new commit. This is a safe way to undo changes, as it has no chance of re-writing the commit history. 
    For example, the following command will figure out the changes contained in the 2nd to last commit, 
    create a new commit undoing those changes, and tack the new commit onto the existing project  (git revert HEAD~2)
On the commit-level, resetting is a way to move the tip of a branch to a different commit. This can be used to remove commits from the current branch. 
	For example, the following command moves the hotfix branch backwards by two commits. ( git reset HEAD~2)

## How to switch from branch to another branch? (N)
git checkout <banch -name>

## What is git cherry-pick ? (N)
* Cherry pic we are using undoing changes from any branch to other.
* This mainly we are used mostly for mistake of devlopers done wrong branch commits. 
    So that time we are using cherry-pick to rersolve. 

## What is merge conflicts? Have you resolved the merge conflicts? (N)
* one person delete the file and one person edit the same file then its create merge conflicts.
    (or)
* one person add the line and another person delete the line then its will create merge confilcts
* When it will hapen shows the massage then we will edit the file and confrim the changes.

## How do you check after git merge …where merging is correctly or not? ()
* In git logs we know the merge is happend or not



------------------------------------
## Azure DevOps
---------------------------

## Explain variable and variable groups in Azure DevOps

Variables allow you to store some data that can be used across pipelines. All variables are mutable and stored as strings.
Variable Groups provide the ability to use variables across multiple pipelines. You can store secrets in variable or variable groups

Why use CI, CD, and Azure Pipelines?
Continuous Integration (CI) allows developers to detect early bugs and errors by merging their changes into a main branch frequently. Automated tests are run based on every commit to ensure that the changes being made meet the standard. This alleviates developers from manual tasks as the build and testing process is automated.

Continuous Deployment (CD) automates the deployment process by allowing developers to release new changes being made to customers quickly and safely. The automation of this process reduces human errors in the deployment phase, leading to more reliable releases and better resource management.

Azure Pipelines is flexible as it supports Windows, Linux, and macOS as well as being able to be deployed to the cloud, on-premise and hybrid environments. Its seamless integrations and rich set of features allow organizations to work within a comprehensive environment across different platforms.

## What are pull requests in Azure DevOps Repos?
Pull requests are one of Azure DevOps's main features to ensure team collaboration, code review, maintenance of code, and quality throughout the software development lifecycle. Developers will propose changes to the codebase by creating a pull request to submit changes to a branch in a Git repository. Other members of the team will review these changes, provide feedback and make improvements before it is merged into the main branch.

This collaborative and disciplined approach to software development maintains a high standard of code quality and software delivery with a robust CI/CD pipeline.

## What is Jenkins, and how can it be integrated with Azure Pipelines?

Jenkins is an open-source automation server for continuous integration and delivery (CI/CD) of software projects. It helps developers automate various stages of the development and deployment process, including building, testing, and deploying applications. 

You can follow the following steps to integrate Jenkins with Azure Pipelines: 

Install Jenkins: Set up Jenkins on a server or in the cloud as per your requirements.

Install Azure Pipelines plugin: In Jenkins, install the Azure Pipelines plugin, which allows communication between Jenkins and Azure Pipelines.

Configure Azure Pipelines service connection: Create a service connection in Azure Pipelines to establish a connection with Jenkins. This connection will enable Azure Pipelines to trigger Jenkins jobs and retrieve build artifacts.

Set up Jenkins jobs: Create Jenkins jobs that represent the different stages of your CI/CD process. These jobs can include tasks like code compilation, testing, and packaging.

Configure Jenkins integration in Azure Pipelines: In Azure Pipelines, set up a pipeline that calls the Jenkins jobs using the configured service connection. You can define when to trigger Jenkins jobs and specify which Jenkins instance to use.

Monitor and manage: Azure Pipelines will trigger Jenkins jobs as part of your CI/CD process once the integration is set up. You can monitor the build status, logs, and artifacts in both Jenkins and Azure Pipelines to ensure smooth integration and deployment.

## Do you handle rollback procedures in Azure DevOps in case of a failed deployment."
In case of a failed deployment, I ensure that our release pipelines are configured with automated rollback mechanisms. For instance, using Azure App Service deployment slots, I can swap to a previous stable version instantly. Additionally, I use feature flags to disable problematic features without affecting the overall service, allowing for a more granular approach to rollbacks."


## Do you incorporate automated testing into Azure DevOps pipelines?
I incorporate automated testing by defining test stages in Azure Pipelines. I start with unit tests running against every build to catch issues early. For integration and UI tests, I use Azure Test Plans to manage test cases and execute them automatically on deployment to specific environments. This ensures that we maintain high code quality and catch regressions promptly.

------------------------------------
## Azure DevOps
---------XXX------------------




----------------------------------
## Jenkins
-----------------------

## Explain how you can move or copy Jenkins from one server to another?
* Slide a job from one installation of Jenkins to another by copying the related job directory
* Make a copy of an already existing job by making clone of a job directory by a different name
* Renaming an existing job by renaming a directory.

## Explain how can create a backup and copy files in Jenkins?
* Jenkins saves all the setting, build artifacts and logs in its home directory, to create a back-up of your Jenkins setup, just copy this directory. You can also copy a job directory to clone or replicate a job or rename the directory.

## How To Schedule Jenkins Build Periodically (hourly, daily, weekly)? Explain the Jenkins schedule format.
* To schedule Jenkins builds periodically at specific intervals, you can use the built-in scheduling feature. Jenkins uses a cron-like syntax for scheduling, allowing you to specify when and how often your builds should run.

## What Is Jenkins Home Directory Path?
* The Jenkins home directory is where Jenkins stores its critical data, including job configurations, logs, plugins, and more. The location of this directory varies by operating system but can typically be found at:

Linux/Unix: /var/lib/jenkins
Windows: C:\Users<YourUsername>.jenkins
macOS: /Users/<YourUsername>/.jenkins
* You can configure its location during installation or in the Jenkins startup script. Understanding this directory is essential for managing and backing up Jenkins data.

## Explain about Master-Slave Configuration in Jenkins.
A Master-Slave configuration in Jenkins, also known as a Jenkins Master-Agent configuration, is a setup that allows Jenkins to distribute and manage its workload across multiple machines or nodes. In this configuration, there is a central Jenkins Master server, and multiple Jenkins Agent nodes (slaves) that are responsible for executing build jobs. This architecture offers several advantages, including scalability, parallelism, and the ability to run jobs in diverse environments.

## What Are The Different Types Of Jenkins Jobs?
Jenkins offers a variety of job types to accommodate different automation and build needs. Some common types include:

Freestyle Project: Basic job with a simple UI for build steps.
Pipeline Project: Define build processes as code using Groovy scripts.
Multi-configuration Project: Build and test on multiple configurations in parallel.
GitHub Organization Project: Automate CI/CD for GitHub repositories.
Maven Project: Specifically for Java projects using Maven.
Folder: Organize and group related jobs.
External Job: Trigger builds on remote Jenkins instances.
GitHub PR Builder: Automate PR builds in GitHub repositories.
Copy Artifact Project: Copy build artifacts between jobs.
Parameterized Build: Pass parameters to customize job execution.
Build Flow: Orchestrate complex build processes with Groovy.
GitHub Organization Folder: Organize GitHub repos within an organization.
Freestyle with Maven: Blend freestyle and Maven build steps.

## What is the purpose of using artifacts in a pipeline?
Artifacts are output files generated during the build process that
are needed for subsequent stages or for deployment. They can be binaries,
packages, or other relevant files.

## What is the difference between auto-scaling and ELB?
Load balancing evenly distributes load to application instances in all availability zones in a region while auto scaling makes sure instances scale up or down depending on the load.
Auto scaling is a cloud computing technique for dynamically allocating computational resources. Depending on the load to a server farm or pool, the number of servers that are active will typically vary automatically as user needs fluctuate.
Auto scaling and load balancing are related because an application typically scales based on load balancing serving capacity. In other words, the serving capacity of the load balancer is one of several metrics that shapes the auto scaling policy.

## What are the types of load balancers?

Elastic Load Balancing supports the following types of load balancers:
Application Load Balancers - It allows a developer to configure and route incoming end-user traffic to applications based in the Amazon Web Services (AWS) public cloud.It pushes traffic across multiple targets in multiple AWS Availability Zones.

Network Load Balancers - The Network Load Balancing feature distributes traffic across several servers by using the TCP/IP networking protocol.It works by combining two or more computers that are running applications into a single virtual cluster, NLB provides reliability and performance for web servers and other mission-critical servers.

Gateway Load Balancers - GLB enable you to deploy, scale, and manage virtual appliances, such as firewalls, intrusion detection and prevention systems, and deep packet inspection systems. A Gateway Load Balancer operates at the third layer of the Open Systems Interconnection (OSI) model, the network layer.

Classic Load Balancers - It provides basic load balancing across multiple Amazon EC2 instances and operates at both the request level and connection level. Classic Load Balancer is intended for applications that are built within the EC2-Classic network.

## You have a git repository with multiple branches, you want to create a pipeline job for every branch. What are you going to do?
Use a Multi-branch pipeline project.

## You have a Jenkins pipeline that deploys a web application to multiple environments (development, staging, and production). However, you notice that the production deployment often fails due to connectivity issues with the production server. How would you address this problem?

Implement retry mechanisms in the deployment steps to handle intermittent connectivity problems.
Monitor and log connectivity issues to identify patterns or root causes.
Consider implementing a blue-green deployment strategy to minimize downtime during deployments.
Set up monitoring and alerts to quickly detect and respond to production server connectivity issues.

## You have a multiple repositories hosted on different Git servers. Each repository has its own Jenkins pipeline. How would you set up a Jenkins pipeline to handle this multi-repository project?

Create a parent project or repository to coordinate the builds.
Configure webhooks or triggers in each repository to notify the parent project of changes.
Use Jenkins’ Pipeline Multibranch functionality to dynamically create pipelines for each repository.
Share common configurations and scripts among the pipelines for consistency.

## You want to implement a Jenkins pipeline that runs on a specific schedule (e.g., every night at 2 AM). How would you configure your Jenkins pipeline to trigger the build at the desired schedule?

Use Jenkins’ built-in “Build periodically” option in the pipeline configuration.
Define a cron-like schedule (e.g., “H 2 * * *”) to run the pipeline at 2 AM daily.
Ensure that the Jenkins server’s time zone settings align with the desired schedule.

## Where we find errors in Jenkins?
We can find errors in the console output, in the build log, and in the Jenkins dashboard.

## 

## 


----------------------
Docker
----------------------

## What are the important features of Docker?
Here are the essential features of Docker:

Easy Modeling
Version control
Placement/Affinity
Application Agility
Developer Productivity
Operational Efficiencies

## What command should you run to see all running container in Docker?
docker ps

## Where the docker volumes are stored?
/var/lib/docker/volumes

## How to use JSON instead of YAML compose file?
docker-compose -f docker-compose.json up

## Can you lose data when the container exits?
No, any data that your application writes to disk get stored in container. The file system for the contain persists even after the container halts.

## What is Docker Engine?
Docker daemon or Docker engine represents the server. The docker daemon and the clients should be run on the same or remote host, which can communicate through command-line client binary and full RESTful API.


## Can you tell the differences between a docker Image and Layer?
Image: This is built up from a series of read-only layers of instructions. An image corresponds to the docker container and is used for speedy operation due to the caching mechanism of each step.

Layer: Each layer corresponds to an instruction of the image’s Dockerfile. In simple words, the layer is also an image but it is the image of the instructions run.

## Can you differentiate between Daemon Logging and Container Logging?
In docker, logging is supported at 2 levels and they are logging at the Daemon level or logging at the Container level.
Daemon Level: This kind of logging has four levels- Debug, Info, Error, and Fatal.
- Debug has all the data that happened during the execution of the daemon process.
- Info carries all the information along with the error information during the execution of the daemon process.
- Errors have those errors that occurred during the execution of the daemon process.
- Fatal has the fatal errors that occurred during the execution.
Container Level:
- Container level logging can be done using the command: sudo docker run –it <container_name> /bin/bash
- In order to check for the container level logs, we can run the command: sudo docker logs <container_id>

## Difference between docker compose and docker swarm
* Docker Swarm
Docker Swarm allows you to scale your web application over one or more machines. In contrast.
Scaling your web application using Docker-Compose on a single host is only suitable for testing and development.
Docker Swarm and associated subcommands, such as Docker Swarm and Docker Stack, are integrated into the Docker CLI itself.
Docker Swarm manages and orchestrates a cluster of Docker containers.


* Docker Compose
Docker-compose will execute your web application on a single Docker host.
Scaling your web app using Docker-Compose on a single server is only practical for testing and development.
Docker-Compose is a standalone binary.
Docker compose is used to construct, distribute and execute independent containers

## How Do You Update a Docker Container Without Losing Data?
To update a Docker container without losing data, you can try on using a combination of Docker volumes or bind mounts to make the data persistant outside the container. When updating, create a new container with the updated image and then link it to the existing data volume.


## What Is the Purpose of the “docker checkpoint” Command?

The “docker checkpoint” command is vital for the creation of snapshots of a running container’s state , including its file system and the memory. It is particularly useful for experimental mode of scenarios such as debugging or migration.
For example to checkpoint a container named “my_container,” the command would be:

docker checkpoint create my_container checkpoint_name


------------------------
K8
--------------------------

## difference between a Kubernetes ConfigMap and a Kubernetes secret?
A ConfigMap is a Kubernetes API object used to store data that is not confidential. ConfigMap information is stored in a variety of information formats, such as key-value pairs and JSON. (The sample Kubernetes ConfigMap below contains both name-value pairs and a JSON object.) Typically a developer uses a ConfigMap to provide information to the cluster that gets consumed by other API objects.

A Kubernetes secret is a Kubernetes object that stores information in the cluster in an encrypted format. Typically a secret is used to store confidential information. The example below is a manifest file that describes a Kubernetes secret for a username/password pair. Notice the Base64 encrypted values.





----------------------------
AWS
--------------------

## What is min and Max size of s3 bucket
* 0 to 5TB

## Describe the various S3 storage classes.
S3 has various storage classes, including the default S3 standard, infrequent access storage, and Amazon Glacier.

## What is the Differnce between SNS and SQS

## How does Lambda handle failure during event processing?
In Lambda, a function is run in either synchronous or asynchronous mode. If a function fails in synchronous mode, then it just gives an exception to the calling application. If a function fails in asynchronous mode, then it is retried at least three times.

## What are the limitations of AWS Lambda?
Some of the limitations of AWS Lambda are mentioned below:

The default deployment package size is 50 MB.
The ephemeral disk space is limited to 512 MB, as the Lambda function will take a longer time to execute with a larger package size.
The execution time is longer when memory allocation is lower.
The memory range is between 128 and 10,240 MB.
The maximum execution timeout for a function is 15 minutes.

## What is the difference between Amazon RDS and Amazon EC2?
RDS is automated and easily integrated with Amazon's scaling tools for both vertical and horizontal scaling. In EC2, the user requires setting up a scalable architecture manually.

## What are the differences between RDS, DynamoDB

Amazon RDS is a database management service that helps manage database administrative tasks and structured data. It is compatible with database engines, such as Oracle, Microsoft SQL Server, MariaDB and Amazon Aurora. It is the only service among the three that supports Microsoft SQL Server. DynamoDB is a key-value database that supports unstructured data and runs on NoSQL engine. It is an enterprise-level solution that is best suited for use cases, such as session data and key-valued cloud services

## Explain the difference between AWS ECS and Kubernetes

WS ECS and Kubernetes are both container orchestration tools but differ in their ecosystem and integration with AWS services. ECS is a proprietary AWS service deeply integrated with the AWS ecosystem, offering a simpler setup for AWS environments with less configuration overhead. Kubernetes, on the other hand, is an open-source system that offers greater flexibility and portability across different environments, including on-premises and other cloud platforms. Kubernetes has a steeper learning curve but provides more features and customization options. ECS is often chosen for its tight integration with AWS services, while Kubernetes is preferred for multi-cloud or hybrid cloud environments.

## Describe how you would deploy an application using AWS ECS.

Create a Task Definition: Define your application with one or more containers, specifying the Docker image, CPU, memory, ports, and environment variables.
Set Up a Cluster: Create an ECS cluster which will host your application. You can choose between EC2 and Fargate launch types.
Configure a Service: Create a service within your cluster, specifying the task definition to use, the desired number of tasks, and (if needed) the load balancer to distribute traffic to your tasks.
Deploy: Launch your service. ECS schedules and runs your tasks according to the configuration. For updates, you can create a new version of your task definition and update the service to use the new version, enabling rolling updates.
Monitor: Utilize AWS CloudWatch to monitor the performance and logs of your containers and cluster, adjusting resources as needed.





-----------------
Linux
-----------------------

## How to create cron job 
* Create or Edit Crontab File "crontab -e"
* List of cron job "crontab -l"
* find the cron service details "systemctl start crond.service"
* find the status of cron jobs "service crond status"


Okay Anurag, I am done with the interview. HR will provide further proceedings.

She has limited knowledge of GitHub, Jenkins CI/CD, and AWS services such as RDS, EC2, CloudFormation and S3.
There is no knowledge of Docker, Kubernetes, Azure DevOps.
There is little knowledge of Lambda.
