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
 ### Ansible Roles
> Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content into roles, you can easily reuse them and share them with other users.


  #### Start by creating a role
  Run the following command `ansible-galaxy init <role_name>`
  #### View your role structure
  Run `tree` to display your command structure
 
