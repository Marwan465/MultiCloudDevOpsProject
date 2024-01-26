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
     - install recommended plugins and then create an admin user
  [for more detailed info on how to setup jenkins](https://www.linuxbuzz.com/install-jenkins-on-rhel-rockylinux-almalinux/)
  ### Download required plugins
  ### Configuring credentials
  ### Jenkins shared library
   #### Configure jenkins shared library
  ### Triggers
   #### Creating github webhook
  ### Pipeline
   #### Importing and using shared library
 
