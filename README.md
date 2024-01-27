# Documentation
  ![421734725_788162733339542_9095234959083725977_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/430dcfdd-6858-4a9c-8711-199f87ec8a41) 

### Deliverables
- [Terraform](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#terraform) 
- [Ansible role](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible) 
- [jenkins shared library](https://github.com/Marwan465/jenkins-simple-library) 
- [JenkinsFile](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/jenkinsfile) 
- [DockerFile](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/Dockerfile) 
- [Jenkins job configuration instructions for building Docker image on code commits](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins-job-configuration-instructions) 
- [Instructions for setting up centralized logging](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#monitoring-and-logging) 
- [Instructions for AWS integration in the Terraform Code](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#aws-integration)
  - [S3 Terraform Backend state](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#s3-terraform-backend-state)
  - [Integrate CloudWatch for monitoring](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#integrate-cloudwatch-for-monitoring)

### Goals 
- provision AWS resources using Terraform
- Manage AWS EC2 instances configurations using Ansible
- Application containerization using docker to build our image
- Create and use jenkins shared library
- Create jenkins pipeline to achieve continous integration and deployment
- Monitoring and logging our containers
### Objectives 
- configure our AWS to authenticate Terraform, describe and understand the structure of terraform modules
- Describe the architecture of ansible roles and how to connect ansible to aws ec2 to be managed
- using dockerfile to build our image and use our docker image to create our containerized app
- Describe and define jenkins shared library & configure jenkins to use the library.
- Describe jenkins pipelines,  connect jenkins to github,docker,openshift using their plugins,configure jenkins credentials to authenticate, trigger the pipeline on certain events and how to import and use our jenkins shared library in the pipeline
### Sections
- [Ansible](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#ansible)
   - [Ansible Setup instructions](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#ansible-setup-instructions)
      - [configuring ansible to access ec2](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#configuring-ansible-to-access-ec2)
   - [Architecture overview](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#understanding-ansible-roles-architecture)
   - [Troubleshooting](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#troubleshooting)
- [Jenkins](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins)
  - [Jenkins Setup instructions](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins-setup-instructions)
  - [Download required plugins](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#download-required-plugins)
  - [Configuring credentials](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#configuring-credentials)
- [Jenkins job configuration instructions](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins-job-configuration-instructions)
     - [Creating github webhook](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#creating-github-webhook)
     - [Creating pipeline trigger](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#creating-pipeline-trigger)
     - [Creating Pipeline](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#creating-pipeline)
- [Jenkins shared library](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins-shared-library)
     - [Configure jenkins shared library](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#configure-jenkins-shared-library)
- [Pipeline](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#pipeline)
     - [Importing and using shared library](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#importing-and-using-shared-library)
- [Docker](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#docker)
     - [Setting Up Docker](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#setting-up-docker)
     - [Project Repo](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#project-repo)
     - [Troubleshooting](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#troubleshooting-1)
- [Terraform](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#terraform)
   - [Prerequisites](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#prerequisites)
   - [Terraform Setup instructions](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#terraform-setup-instructions)
   - [Aws-cli Setup instructions](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#aws-cli-setup-instructions)
   - [AWS configure Access keys and region](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#aws-configure-access-keys-and-region)
   - [Terraform Module Architecture](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#terraform-module-architecture)
- [Monitoring and Logging](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#monitoring-and-logging)
   - [Logging architecture](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#logging-architecture)
   - [Setup instruction for centralized logging](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#setup-instructions-for-centralized-logging--openshift-container-platform-414-)
- [AWS Integration](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#aws-integration)
   - [Prerequisites]()
   - [Set Up S3]()
   - [Create an IAM Role]()
   - [Configure Terraform Backend]()
     

   




## Ansible
> Ansible is the simplest way to automate apps and IT infrastructure. Application Deployment + Configuration Management + Continuous Delivery
 #### Ansible Roles
> Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content into roles, you can easily reuse them and share them with other users.
### Ansible Setup instructions
- Start by installing ansible  `sudo dnf install ansible` note that galaxy collections are part of t ansible installation \
- check your ansible version `ansible --version`
- creating **[ansible inventory](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/ansible/hosts)**
     - this where you add the **hosts** you want to manage using ansilbe and the **connections variables** to access those hosts if it was needed
  #### configuring ansible to access ec2
     - provide your ec2 public ip/dns, ec2-user name and key.pem file you associated with the ec2 on creation inside your **[ansible inventory](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/ansible/hosts)**
         ```
         [ec2_instances]
          #your ec2 public ip/dns
         [ec2_instances:vars]
          ansible_user=ec2-user                         #this is the default user name so if you made a custom one please change it accordingly
          ansible_ssh_private_key_file=path/to/key.pem  #the key-pair associated with the ec2 instance when it was created give the path of the yourkey.pem
         ```
         - **Note** ec2-user is the default name so if you changed it provide the new name
         - **Note** the key provided by aws for the ec2 can be downloaded one time only so if you lost it create another one
      
- Start by creating a **[role](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5)**
    - Run the following command `ansible-galaxy init <role_name>`
- View your role structure
    - Run `tree` provided with your role path to display your ansible role structure
### Understanding ansible roles architecture
**ansible role** divides your playbook into smaller chunks where each chunk serve a certain role which makes it more readable and easier to maintain without messing up the whole playbook. \
our project **ansible role** structure is \
![419479421_1744307166068783_306971298928101798_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/f9fa24b5-8283-43a4-8bb8-f71df1966dbc) \
* In the **[vars](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/vars)** and **defaults** **main.yml** file you list your variables to later be used 
  * **Note**  **vars** have the higher priority so if **vars** and **defaults** have the same variable defined ansible will use the one in **vars**.
* In the **[tasks](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/tasks)** dir you define your tasks that will be executed on your managed hosts described in your **inventory** file you can either implement all your tasks in the **main.yml** or in other files.yml and include those files inside the **main.yml**.

* In the **[handlers](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/handlers)** that where you define a certain task to be carried out on a certain event when it's notified by the main task. 
* **Now** include your roles that you want to run and hosts that you want to manage inside the main **[playbook.yml](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/ansible/lab5.yml)**. 
* **Time to run** `ansible-playbook -i /path/to/inventory_file your_playbook.yml`
 ```
  ansible-playbook -i hosts lab5.yml
  ```
 ### Troubleshooting
  - If you encountred an issue with key.pem permission make sure it has the following permissions
    ```
    chmod 600 yourkey.pem
    ```
  - you might in some scenarios need python and boto3 packages
    ```
    dnf install python3
    dnf install python3-pip
    pip3 install boto3
    ```
## Jenkins
  ### Jenkins Setup instructions
  - [choose your host and follow the guide on jenkins website](https://www.jenkins.io/download/)
  - **on linux**
    - Make sure to allow **jenkins service** in your firewall  `firewall-cmd --add-service=jenkins --permanent`
    - Or allow jenkins default port  `firewall-cmd  --add-port=8080/tcp --permanent`
    - Then reload your firewall to apply the changes  `firewall-cmd --reload`
    - Check your new changes `firewall-cmd --list-all`
    - start jenkins `systemctl enable --now Jenkins`
       > The enable subcommand doesn't start a service, it only marks it to start automatically at boot. To enable and start a service at the same time, use the --now option
    - unlock jenkins `cat /var/lib/jenkins/secrets/initialAdminPassword` copy the password and used in jenkins web interface next step
  - **on your browser**
     - navigate to your_host_that_jenkins_is_installed:8080 to open jenkins web interface and use the password you copied from the previous step
     - install recommended plugins and then create an admin user. \
  [for more detailed info on how to setup jenkins](https://www.linuxbuzz.com/install-jenkins-on-rhel-rockylinux-almalinux/)
  ### Download required plugins
   - On jenkins web interface navigate to `manage jenkins` --> `plugins`--> `Available plugins` download docker,github and redhat necessary plugins
      - docker commons plugin, docker API plugin, docker plugin, docker-build-step, docker compose build step plugin
      - github plugin, github api plugin ...
   - **Note** some plugins might be already installed when we were setting up our jenkins
  ### Configuring credentials
  - On jenkins web interface navigate to `manage jenkins` --> `Credentials` --> `system` --> `click your desired domain` --> `Add Credentials`
  - On the new credential template
    - **docker hub credentials**
      - **kind** choose **username with password**
      - provide your dockerhub username and password
      - in the id provide the id name that you will use in your pipeline next e.g dockerhub_id
    - **openshift cluster credentials**
        - **kind** choose **Secret File**
        - **File** click browse and choose you **KubeConfig** file
        - In the id provide the id name that you will use in your pipeline next e.g KubeConfigFile
  ### Jenkins job configuration instructions
  **Trigger a job to build docker image based on certian event on our github repo e.g push/commit events**
   #### Creating github webhook
   - On your **github repo** you want to trigger a pipeline on it's events navigate to your github repo url and click `settings`
   - on left pane click `webhook`
   - In payload URL add your `jenkinsIP:8080/github-webhook`
   - Content type select `application/json`
   - trigger on push
   - customize trigger events
   - ![elbashayer_image_1535908697](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/a30f97ba-aa33-4f55-b23e-5cc3445a3afe)
  #### Creating pipeline trigger
   - On your jenkins web interface
     - Click `New Item` and create a pipeline
        - ![422628438_912282617108922_2396793395277846722_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/21fce714-e6cd-4f04-b46b-aefdb188a3d6)
     - Inside your pipeline click `Configure`
        - ![414838815_298759749448584_8842013607062473531_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/b930a463-7fc1-4a45-981f-c7a953dc6131)
     - Scroll down to **Build Triggers** and tick **GitHub hook trigger for GITScm polling** this will make the github hook we created above notify jenkins when an event happens
        -   ![415403153_935442858018918_4788590869331520208_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/bcc048db-aaf0-405f-b99b-fbfb20089a0f)
        -   **Note** you can tick **Poll SCM** options so that **jenkins** will poll the **SCM**
     - Scroll down again to **Pipeline**
        - In **Definition drop down menu** select **Pipeline script from SCM**
        - In **SCM** drop down menu choose **Git** provide your **github repo url** that has the **jenkinsfile** and make sure to select the right **branch**
        - ![416435539_759218428967733_3757825706753134672_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/7c17c793-9633-477f-8cc7-330230ff0325) ![416358576_1599111860492951_6964332434369414991_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/11579033-edb9-4cb3-bdf7-1a507e4b2609)
     - **Apply** And **Save**

  #### Creating Pipeline
  In your jenkinsfile add a script to build your image the script looks something like this 
```  
environment {
  DockerRegistry = "docker.io/registryname"
  tag = "latest"
  image = "my-app"
}
stage('Building our image') {
  steps{
    script {
      dockerImage = docker.build("${DockerRegistry}/${image}:${tag}")
}
}
}
``` 

  ### Jenkins shared library
   jenkins shared library is a group of methods(functions) that carry certain tasks these tasks are usually repeated alot during our coding so to avoid reinventing the wheel and boilerplate codes we define them once in a library and import those libraries whenever 
    we need \
   e.g **[the library we are using in our project](https://github.com/Marwan465/jenkins-simple-library)**
   #### Configure jenkins shared library
   - so now we need to be able to import this library in our pipeline so we need to point jenkins to it.
     - On jenkins web interface navigate to `manage jenkins` --> `System` --> scroll down and locate `Global Pipeline libraries`
       - provide your library name this name will be used later to import the library and the library version
       - **Retrieval method** pick **Modern SCM**
       - **Source Code Management** choose **Github** ( or whatever SCM you have you library at)
       - **Credentials** leave the default if the repo is public or add your configure credentials
       - **Repository HTTPS URL** provide your repo url that has the library
       - **Apply** and **Save**
       - ![422628433_651172903692243_8022943870626548500_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/a46a6571-28d9-402f-b6a0-f0a691f1c930)
       - ![420709518_220382544397726_3829107196365714049_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/04e27ff8-ad7a-4467-9a3f-9f4755eed406)

     

  ### Pipeline
   #### Importing and using shared library
   - inside your pipline import your library `@Library('the_name_of_your_library_you_configure_in_Jenkins@library_version') _`
   - To call a method use your vars file name for e.g in our library (below image) to call the method **buildDockerImage** which is defined in **dockerize.groovy** in your pipeline you would call it as `dockerize.buildDockerImage(registry)`
   - ![419926150_343121968625879_8202173263761135491_n (1)](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/eae6bc26-cf24-41b3-80ec-53dc61dc02ab)

  **Note** groovy can be dynamically typed which mean you don't have to state the type of the variable before declaring it

## Docker
 ### Setting Up Docker
- **[Setting up docker](https://docs.docker.com/engine/install/)**
 ### Project Repo
- **[Repo used in the project](https://hub.docker.com/repositories/marwan512)**
 ### Troubleshooting
- **docker.sock** permission denied error make sure your user is added to docker group and that the docker.sock file has the required permissions
  ```
  usermod -aG docker ${USER}
  chown $USER /var/run/docker.sock
  ```
 
  
## Terraform
 ### Prerequisites
  - Terraform vscode extension
  - Terraform Cli
  - AWS-CLI
 ### Terraform Setup instructions
  - **[Follow Hashicorp Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)** 
  - In your vscode install Terraform extension
  -  ![420034640_908502564183397_4190505788383919799_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/7f4902ea-9b35-4e09-82e1-c8a289025138)

 ### Aws-cli Setup instructions
 - **[Follow AWS instruction to install aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)**
 ### AWS configure Access keys and region
 - Now it's time to configure our **AWS IAM user Access keys** in your command line run the following command and provide your **Access Key ID** and **Secret Access Key** these are the credentials **Terraform** will be using to be authenticated by **AWS**
   ```
   aws configure
   ```
 - ![420092284_688208766838917_4832216871114481797_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/91d1b44f-40f5-4140-b0ab-028210845ef0)

 ### Terraform Module Architecture
 - Now it's time to create our Terraform Module Structure it looks something like this
 - ![420697653_314612114363608_4412397192236509058_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/3f7b9cef-b3bb-46e4-b425-23d42288cca8)
    - 1- Is the **Root main.tf** specifies the modules to pass and recieve variable from those modules
    - 2- The **Root output.tf** these are the variables that will be displayed in command line after we finish provisioning 
    - 3- The **Root variables.tf** are the variables taken as input by **Root main.tf** 
        - **Note** if some variable wasn't assigned a value in the **Root variables.tf** you will be prompt to  provide that value when you run the **Terraform module**
    - 4- The values the **Modules** will pass to **Root main.tf**
    - 5- The values the **Root main.tf** passes to the **Modules** as inputs
 - Now to run your module
   ```
   terraform init
   terraform apply
   ```

## Monitoring and Logging
### Logging architecture
 ####  Collector
 > The collector is a daemonset that deploys pods to each OpenShift Container Platform node. It collects log data from each node, transforms the data, and forwards it to configured outputs. You can use the **Vector** collector or the **legacy Fluentd** collector.
 #### Log store
 > The log store stores log data for analysis and is the default output for the log forwarder. You can use the default **LokiStack** log store, the **legacy Elasticsearch** log store, or forward logs to additional external log stores.
 #### Visualization
 > You can use a UI component to view a visual representation of your log data. The UI provides a graphical interface to search, query, and view stored logs. The OpenShift Container Platform web console UI is provided by enabling the OpenShift Container Platform console plugin.
### Setup instructions for centralized logging ( OpenShift Container Platform 4.14 )
 - **Prerequisites**
   - Administrator permissions.
   - Access to the OpenShift Container Platform web console.
 - **Procedure**
   - **Installing OpenShift Elasticsearch Operator**
      - In the OpenShift web console, click **Operators** → **OperatorHub**. 
      - Type **elasticsearch** in the Filter by keyword box. 
      - Choose **OpenShift Elasticsearch Operator** from the list of available Operators, and click Install. 
   - **Installing Red Hat OpenShift Logging Operator**
    > - In the OpenShift Container Platform web console, click **Operators** → **OperatorHub**. 
    > - Type **OpenShift Logging** in the Filter by keyword box. 
    > - Choose **Red Hat OpenShift Logging** from the list of available Operators, and click Install. 
    > - Ensure that A specific namespace on the cluster is selected under Installation mode. 
    > - Ensure that Operator recommended namespace is **openshift-logging** under Installed Namespace. 
   - **Creating a ClusterLogging object by using the web console**
     - After **Installing Red Hat OpenShift** Logging Operator click **Operators** → **Installed Operators** → **Red Hat OpenShift Logging**
     - Click **Cluster Logging** Tab → **Create ClusterLogging**
     - ![elbashayer_image_1535908697](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/ad03be45-cab9-400e-88ab-902b98839bd7)
     - In **Collection** section → **Collector Implementation** drop down menu choose either **vector** or **fluentd**
     - ![cluster logging collection](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/ddebedc4-ecd5-4412-9f37-200745e2276b)
     - Scroll down to **LogStore** section select your logstore and make sure it's installed in your **Installed Operators**
     - ![cluster logging logstore and virtualization](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/00a75e76-e340-499a-b840-a9956b10f909)
 
 - **Note**
    - > Fluentd and ElasticSearch are deprecated and are planned to be removed
 - For more detailed info and installation of other versions please refer to [openshift docs for logging](https://docs.openshift.com/container-platform/4.14/logging/cluster-logging-deploying.html) & [openshift docs for log storages](https://docs.openshift.com/container-platform/4.14/logging/log_storage/installing-log-storage.html)
    


## AWS Integration
### S3 Terraform Backend state
 ### Prerequisites
 - AWS-cli
 - Terraform
 - IAM role
 ### Procedure
 - Create s3 bucket either [Manualy](https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-bucket.html) or using terraform
```
   resource "aws_s3_bucket" "tfstateBucket" {
  bucket = "tfstate-bucket-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```
 -  Include the backend block in the Terraform configuration
```
terraform {
  backend "s3" {
    bucket         	   = "tfstate-bucket-1"
    key              	   = "/path/to/my/key"   // **Note** this is where the terraform state will be written to so it has to be unique to ensure that state files do not overwrite each other, it uses path-like structure to organize state files within the S3 bucket.
    region         	   = "us-east-1"
    encrypt        	   = true
    
  }
}
```
 - [Create an IAM User and Policy Create an IAM user with the necessary permissions to access the S3 bucket](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.IAM.S3CreatePolicy.html)
   - Terraform will need the following AWS IAM permissions on the target backend bucket:
```
     s3:ListBucket on arn:aws:s3:::mybucket
     s3:GetObject on arn:aws:s3:::mybucket/path/to/my/key
     s3:PutObject on arn:aws:s3:::mybucket/path/to/my/key
     s3:DeleteObject on arn:aws:s3:::mybucket/path/to/my/key
```
- Include the IAM role in the Terraform backend state
```
terraform {
   backend "s3" {
    bucket         	   = "tfstate-bucket-1"
    key              	   = "/path/to/my/key"   // **Note** this is where the terraform state will be written to so it has to be unique to ensure that state files do not overwrite each other, it uses path-like structure to organize state files within the S3 bucket.
    region         	   = "us-east-1"
    encrypt        	   = true
    role_arn   = "arn:aws:iam::ACCOUNT-ID:role/myrole"
    
  }
}
  
```
### Integrate CloudWatch for monitoring
- Create EC2 using Terraform
```
resource "aws_instance" "MY_EC2" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "my-ec2-instance"
  }
}
```
- Create Cloudwatch Alarm Metric
```
resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
     alarm_name                = "cpu-utilization"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "CPUUtilization"
     namespace                 = "AWS/EC2"
     period                    = "120" #seconds
     statistic                 = "Average"
     threshold                 = "80"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     insufficient_data_actions = []
dimensions = {
       InstanceId = aws_instance.MY_EC2.id
     }
}
```
