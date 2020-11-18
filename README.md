## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![https://github.com/donovanconrad/cybersecurity_projects/blob/main/Diagrams/DConrad-Network-Diagram-Web-AND-ELK-Deployment-Azure.png]

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML playbook files may be used to install only certain pieces of it, such as Filebeat.

  - __Ansible/setup-web-playbook.yml__
  - __Ansible/install-elk-playbook.yml__
  - __Ansible/filebeat-playbook.yml__
  - __Ansible/metricbeat-playbook.yml__

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available in addition to restricting access to the network.
- __Load balancers protect direct access to any of the webservers. It only allows designated traffic through and balances that traffic between the available servers.__ 
- __The advantage of a jump box it to have only one outside access point to the network other than web traffic. It provides a gateway to the web servers and elk server so that they cannot be accessed directly from the public internet.__

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metrics and system logs.
- __Filebeat monitors and collects log data on hte server and forwards to Elasticsearch or Logstash for indexing.__
- __Metricbeat collects metrics from the operating system and services running on the serverand forwards to Elasticsearch or Logstash for indexing.__

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name        | Function | IP Address | Operating System |
|-------------|----------|------------|------------------|
| Jump-Box-VM | Gateway  | 10.0.0.4   | Linux            |
| Web-1       | Web Svr  | 10.0.0.5   | Linux            |
| Web-2       | Web Svr  | 10.0.0.8   | Linux            |
| Web-3       | Web Svr  | 10.0.0.9   | Linux            |
| Elk         | ELK Svr  | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-VM machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- __Personal Home IP Not Divulged - See network rules__

Machines within the network can only be accessed by Jump-Box-VM.
- __From Jump-Box-VM (10.0.0.4) is the only way to get to the Web servers or the Elk server.__

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses   |
|-------------|---------------------|------------------------|
| Jump-Box-VM | Yes                 | Personal, not divulged |
| Web-1       | No                  | 10.0.0.4               |
| Web-2       | No                  | 10.0.0.4               |
| Web-3       | No                  | 10.0.0.4               |
| Elk         | No                  | 10.0.0.4               |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- __It can be deployed consistently and reliably to multiple servers.__

The playbook implements the following tasks:
- __Install docker.io__
- __Install python__
- __Install docker__
- __Set virtual memory vlaue__
- __Install and run the ELK container__

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![https://github.com/donovanconrad/cybersecurity_projects/blob/main/Screenshots/docker-ps-elk.png]

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- __Web-1 10.0.0.5__
- __Web-2 10.0.0.8__
- __Web-3 10.0.0.9__

We have installed the following Beats on these machines:
- __Filebeats__
- __Metricbeats__

These Beats allow us to collect the following information from each machine:
- __Filebbeats collects system logs such as SSH logins and sudo commands. This lets us know who is doing what on the servers.__
- __Metricbeats collects metrics such as CPU and Memory useage, Network I/O, etc. THis allows us to know if more servers need to be deployed if the existing ones are maxed out.__

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- __Attach to the Ansible container.__
- __Copy the install-elk-playbook.yml file to /etc/ansible.__
- __Update the /etc/ansible/hosts file to include the header name and IP entry for the ELK server (10.1.0.4 ansible_python_interpreter=/usr/bin/python3)__
- __Run the playbook, and navigate to the Kibana website to check that the installation worked as expected.__

_Answer the following questions to fill in the blanks:_
- __The playbook is the Ansible/install-elk-playbook.yml file. It gets copied to /etc/ansible within the Ansible container.__
- __You update the /etc/ansible/hosts file to make Ansible run the playbook on a specific machine. You specify which machines(s) to run the ELK playbook on versus fileboeat, etc. by the headers in hte /etc/ansible/hosts file. the webservers are grouped together under one header [WEB] and the ELK server is under another header [ELK].__
- __To ensure the ELK server is running, you access http://23.98.131.114:5601/app/kibana__

- __The specific commands needed to download the playbook and update required files are:__
- __Navigate to my Github repository https://github.com/donovanconrad/cybersecurity_projects.git__
- __Navigate to the Ansible folder and right-click and save the install-elk-playbook.yml file__
- __Copy the file to your Ansible container on your jump box.__
- __Edit the file for the correct header for the hosts section at the top of the file. Make sure it matches your entry in /etc/ansible/hosts__
- __Execute the command: ansible-playbook install-elk-playbook.yml__
- __Prior to running the playbook, ensure SSH access is available from the jump box to the elk server. You will need to set up the SSH key to make this work.__ 