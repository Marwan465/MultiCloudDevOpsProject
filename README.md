# Documentation
  ![421734725_788162733339542_9095234959083725977_n](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/430dcfdd-6858-4a9c-8711-199f87ec8a41) 

### Deliverables
[Terraform]() \
[Ansible role](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible) \
[jenkins shared library](https://github.com/Marwan465/jenkins-simple-library) \
[JenkinsFile](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/jenkinsfile) \
[DockerFile](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/Dockerfile) 

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
   - [Architecture overview](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#understanding-ansible-roles-architecture)
- [Jenkins](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins)
  - [Jenkins Setup instructions](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins-setup-instructions)
  - [Download required plugins](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#download-required-plugins)
  - [Configuring credentials](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#configuring-credentials)
  - [Jenkins shared library](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#jenkins-shared-library)
     - [Configure jenkins shared library](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#configure-jenkins-shared-library)
  - [Triggers](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#triggers)
     - [Creating github webhook](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#creating-github-webhook)
  - [Pipeline](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#pipeline)
      - [Importing and using shared library](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#importing-and-using-shared-library)
  - [Docker](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/dev/README.md#docker)

   




## Ansible
> Ansible is the simplest way to automate apps and IT infrastructure. Application Deployment + Configuration Management + Continuous Delivery
 #### Ansible Roles
> Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content into roles, you can easily reuse them and share them with other users.
### Ansible Setup instructions
- Start by installing ansible  `sudo dnf install ansible` note that galaxy collections are part of t ansible installation \
- check your ansible version `ansible --version`
- creating **[ansible inventory](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/ansible/hosts)**
     - this where you add the **hosts** you want to manage using ansilbe and the **connections variables** to access those hosts if it was needed 
     - provide your ec2-user and key.pem file you associated with the ec2 on creation
         - **Note** ec2-user is the default name so if you changed it provide the new name
         - **Note** the key provided by aws for the ec2 can be downloaded one time only so if you lost it create another one
      
- Start by creating a **[role](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5)**
    - Run the following command `ansible-galaxy init <role_name>`
- View your role structure
    - Run `tree` provided with your role path to display your ansible role structure
### Understanding ansible roles architecture
**ansible role** divides your playbook into smaller chunks where each chunk serve a certain role which makes it more readable and easier to maintain without messing up the whole playbook. \
**ansible role** structure looks like this
 ![elbashayer_image_1535908697](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/dbe11e6b-7be3-46bd-9caf-25300593384a) \
* In the **[vars](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/vars)** and **defaults** **main.yml** file you list your variables to later be used 
  * **Note**  **vars** have the higher priority so if **vars** and **defaults** have the same variable defined ansible will use the one in **vars**.
* In the **[tasks](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/tasks)** dir you define your tasks that will be executed on your managed hosts described in your **inventory** file you can either implement all your tasks in the **main.yml** or in other files.yml and include those files inside the **main.yml**.

* In the **[handlers](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/handlers)** that where you define a certain task to be carried out on a certain event when it's notified by the main task. 
* **Now** include your roles that you want to run and hosts that you want to manage inside the main **[playbook.yml](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/ansible/lab5.yml)**. 
* **Time to run** `ansible-playbook -i /path/to/inventory_file your_playbook.yml`
## Jenkins
  ### Jenkins Setup instructions
  - [choose your host and follow the guide on jenkins website](https://www.jenkins.io/download/)
  - on linux
    - Make sure to allow **jenkins service** in your firewall  `firewall-cmd --add-service=jenkins --permanent`
    - Or allow jenkins default port  `firewall-cmd  --add-port=8080/tcp --permanent`
    - Then reload your firewall to apply the changes  `firewall-cmd --reload`
    - Check your new changes `firewall-cmd --list-all`
    - start jenkins `systemctl enable --now Jenkins`
       > The enable subcommand doesn't start a service, it only marks it to start automatically at boot. To enable and start a service at the same time, use the --now option
    - unlock jenkins `cat /var/lib/jenkins/secrets/initialAdminPassword` copy the password and used in jenkins web interface next step
  - on your browser
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
  ### Triggers
  - On your jenkins web interface
  - 
   #### Creating github webhook
   - On your **github repo** you want to trigger a pipeline on it's events navigate to your github repo url and click `settings`
   - on left pane click `webhook`
   - In payload URL add your `jenkinsIP:8080/github-webhook`
   - Content type select `application/json`
   - trigger on push
   - customize trigger events
   - ![elbashayer_image_1535908697](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/a30f97ba-aa33-4f55-b23e-5cc3445a3afe)   
             

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
     

  ### Pipeline
   #### Importing and using shared library
## Docker
- **[Setting up docker](https://docs.docker.com/engine/install/)**
- **[Repo used in the project](https://hub.docker.com/repositories/marwan512)**
 
