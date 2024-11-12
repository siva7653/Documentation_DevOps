## docker Commands:
    docker network ls | LIST OF DOCKER NETWORKS
    docker ps   | LIST OF DOCKER CONTAINERS IN THE RUNNING STATE ONLY
    docker ps -a | LIST OF DOCKER CONTAINERS AVAILABLE (RUNNING AND EXISTING STATES (ALL) )
    docker images   | LIST OF DOCKER IMAGES
    docker rename "exitingContainerName" "newContainerName" | RENAME THE CONTAINER
    docker inspect  -f '{{ .NetworkSettings.IPAddress}}' "containerID/Name" | FIND THE CONTAINER IP ADDRESS
    docker container prune -f(force) | DELETE THE ALL CONATINERS
    docker network prune -f(force) | DELETE THE ALL NETWORKS
    docker network rm "networkName/ID" | DELETE THE PERTICULAR NETWORK
    docker build -t "NewImageName" .(Path) | BUILD THE NEW DOCKER IMAGE
    docker stop $(docker ps -a -q) | STOP ALL CONTAINERS
    docker volume ls | DOCKER VOLUME LIST
    docker volume prune | DELETE THE DOCKER VOLUME
    docker volume create "name of volume" | CREATE DOCKER VOLUME
    docker run -it --name="name of container" --mount source="volume name",destination=/data "image name" | FOR ATTACHING/ MOUNT THE VOLUME WITH CRETATION OF CONTAINER
    docker volume ls -f name="reff name" | FIND THE VOLUME BY NAME
    docker exec -it "container ID/Name" /bin/sh | IN THE CONTAINER
    docker cp "local path '.\README.md'" de367c8273a8:"destination path'/data'" | COPY DATA FROM LOCAL TO CONTAINER
    docker run -it -rm -v "volume name":/data"path" "image name" bash | IF YOU KNOW THE VOLUME FILE "1ST CREATE THE TEMPARARY CONTAINER"
    docker-compose up | TO UP ALL CONTAINERS
    docker-compose down | TO DOWN ALL CONTAINERS


### Docket Network (Conspect)
    Types of network:

    bridge: If no network is specified, then the default is to use the bridge network. Its utilization is infrequent, typically reserved for exceptional circumstances. Bridge drivers creates a internal network of conatiner communications.
    
    host: When creating a container, it is essential to specify the network name; otherwise, it will default to using a "bridge" network.
        host only network.
 
    none: if you dont want to communicate other containers then only we can use this. very rare case we can use this.
        most of the time using for testing purpouse only
        its not communicated internal and outernal also.

## Connected one container to another container
    https://www.youtube.com/watch?v=y_XFIidjtEs
    https://www.youtube.com/watch?v=Bb3GdaQznpU
    working on through bridge network
    Create first network and brige
    when ever your creating container inbuilt network bridge is creted automatically.
    we can attached the containers in one network then we will get communicate one to another containers.
    commands:
    docker pull "imagename"
    docker 
    docker attach "containerName"
    curl http://"'another'containerName":80
    docker run -d --name "containerName" --network "networkName" -p 8082:80 "imageName"

## Dockerfile
    https://www.youtube.com/watch?v=mpovv9aYlYg
   ## Build the Image

## Docker Volume
    Size of volumes
    # Create the volume
    docker volume create "volume name"        
    # create the container
    # attached the volume for perticular container

## Docker Compose
    Docker compose is a tool that allows you to define and run multi container docker application.
    Using compose you can difine a group of related services that can be run together in a single environment,
    making it easir to manage complex applications with multi components.
    For example : you can difine a web application with web server a database, and a caching layer as separte services, each running in its own container.
    file called : docker-compose.yml

----------------------------------------------------------------------
Docker Swarm
----------------------------------------------------------------------
    Docker swarm not build any images it will utilize the existing images only.

## Docker Swarm Commands:
    # Master Node:
    docker swarm service ls
    docker node ls
    docker node update --availability drain "nodeName" | IF YOU DONT WANT TO CREATE THE CONTAINERS IN MASTER NODE
    docker node update --availability active "nodeName" | REMOVE THE DRAIN ON MANAGER NODE
    docker service ps "serviceName" | LIST OF SERVICE
    docker node promote "nodeName/ID" | PROMOTE AS A MANAGER
    docker node demote "nodeName/ID" | DEMOTE AS A MANAGER

    # Slave Nodes:

    
    
## Master and Slave Orchitecture
        #Take 2 Ec2 Instance like Ubuntu

        sudo apt-get update
        sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt-get update
        sudo apt-get install -y docker-ce docker-ce-cli containerd.io
        docker --version
    Master:sudo docker swarm init
        
    # If you want add new node
        docker swarm join-token worker
    # getting below command copy the command and paste the slave node
        #docker swarm join --token SWMTKN-1-2987tpigniz848ssxtjdt5l3bx0yv3johezu5qtf65m11lop05-6mvpujlkob4md9mp6kslsidle 172.31.22.209:2377
    # after apply the above command output: This node joined a swarm as a worker

## How to create swarmpit
    go to below website
    https://swarmpit.io/

    #The below command available on the website
    docker run -it --rm --name swarmpit-installer --volume /var/run/docker.sock:/var/run/docker.sock swarmpit/install:1 9

    #Asking the "stack name" and "user name" and "password"
    #Showing the port id what they taken 
    #Add the port no after public ip Ex: http://54.91.60.114:888/ 

    # Manager in drain state:
        docker node update --availability drain "nodeName" | IF YOU DONT WANT TO CREATE THE CONTAINERS IN MASTER NODE
        docker node update --availability active "nodeName" | REMOVE THE DRAIN ON MANAGER NODE

        In Docker Swarm, when you set a manager node to drain mode, any existing replicas (containers) running on that manager node will be automatically reassigned to other available nodes within the swarm. This redistribution happens as part of Docker Swarm's built-in fault tolerance and load balancing mechanisms.


## Docker container scalling up and down manually
    Master:
        sudo docker service ls
        sudo docker service create --replicas "no fo copies'5'" -p "req.PortNo'80'":80 --name "Service Name" "imageName"
        docker service ps "serviceName"
        docker service rm "serviceName"
        docker service scale "serviceName"=2

## Docker container restart policy
        no: By default if you not assign specifically
        always: Always restart untill unless we stop force. 
                If its docker deamon is restart then it will start agin 
        unless-stopped: Always restart untill unless we stop force. 
                        If its docker deamon is restart also it will Not-start. 
        on-failure: in any failure conditions only then it will restart.
        
        ## Testing the restart policy:
            https://labs.play-with-docker.com/p/cpi8tsiim2rg0097nj1g#cpi8tsii_cpi8ttqim2rg0097nj20

            sudo docker run -dit --name "containerName" --restart no "imageName"
            sudo docker ps -a
            
            sudo docker run -dit --name "containerName" --restart on-failure "imageName"
            sudo stop "containerName"
            # For killing the container
            kill -9 23330
            sudo docker ps -a

            sudo docker run -dit --name "containerName" --restart always "imageName"
            sudo stop "containerName"
            systemctl restart docker
            sudo docker ps -a

            sudo docker run -dit --name "containerName" --restart unless-stopped "imageName"
            sudo docker ps -a
            systemctl restart docker
            



## Test Practice:
    ## 1st test:
    Pull the Image

    Create the Container

    Create the Volume

    Mount the Volume to existing container

    Copy the files from local to volume path folder

    Check the Container volume to file is available or not

    Delete the container for checking the data volume is store or not

    ## 2nd Test:

