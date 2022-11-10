# Assignmet Task
TODO: This is Swisscom Technical Assignment for DevOps Engineer

Using a virtualisation solution, design and implement:
1.  Load Balancer
2.  Web servers
3.  SQL database

The Load Balancer, Web and SQL servers installation is to be automated using any infrastructure automation tool.
Load Balancer, Web and SQL servers configurations must be automated using Ansible.
All Linux servers must be checked against possible software vulnerabilities and if mitigations exist, they must be deployed.
Create a GitHub project to assess the above step.
Write a simple RESTfull API call to READ any data from the SQL database.
The Load Balancer must respond to the URL http://ucpe.swisscom.com:[anyport] and distribute the client requests sequentially across the Web
servers.
Implement a CI-Pipeline for the project (tasks) in GitHub

# Solution 
TODO: This is how the solution is created
1.	Terraform for resource deployment

    All the resources are deployed using terraform and code is stored under the folder Resource deployment Terraform

2.	Rest API

    This is the function app service created as rest api to read the data from SQL database and code is stored in folder Rest API

    
3.	Web servers

    This is the web front end server which will call rest api to read the data from SQL database and disply on the web browser


"# Swisscom" 
"# Swisscom" 
