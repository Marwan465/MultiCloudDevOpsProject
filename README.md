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




## Ansible
> Ansible is the simplest way to automate apps and IT infrastructure. Application Deployment + Configuration Management + Continuous Delivery
 #### Ansible Roles
> Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content into roles, you can easily reuse them and share them with other users.
### Ansible Setup instructions
- Start by installing ansible  `sudo dnf install ansible` note that galaxy collections are part of t ansible installation \
- check your ansible version `ansible --version`
- creating **Ansible inventory**
     - this where you add the hosts you want to manage using ansilbe and the connections variables to access those hosts if it was needed \
        [ansible inventory](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/ansible/hosts)       
- Start by creating a **role**
    - Run the following command `ansible-galaxy init <role_name>`
- View your role structure
    - Run `tree` provided with your role path to display your ansible role structure
#### understanding ansible roles structure
**ansible role** divides your playbook into smaller chunks where each chunk serve a certain role which makes it more readable and easier to maintain without messing up the whole playbook. \
**ansible role** structure looks like this
 ![elbashayer_image_1535908697](https://github.com/Marwan465/MultiCloudDevOpsProject/assets/67644687/dbe11e6b-7be3-46bd-9caf-25300593384a) \
* In the **[vars](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/vars)** and **defaults** **main.yml** file you list your variables to later be used 
  * **Note**  **vars** have the higher priority so if **vars** and **defaults** have the same variable defined ansible will use the one in **vars**.
* In the **[tasks](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/tasks)** dir you define your tasks that will be executed on your managed hosts described in your **inventory** file you can either implement all your tasks in the **main.yml** or in other files.yml and include those files inside the **main.yml**.

* In the **[handlers](https://github.com/Marwan465/MultiCloudDevOpsProject/tree/main/ansible/roles/lab5/handlers)** that where you define a certain task to be carried out on a certain event when it's notified by the main task. 
* **now** include your roles that you want to run and hosts that you want to manage inside the main **[playbook.yml](https://github.com/Marwan465/MultiCloudDevOpsProject/blob/main/ansible/lab5.yml)**. 
* **Time to run** `ansible-playbook -i /path/to/inventory_file your_playbook.yml`
## Jenkins


 
