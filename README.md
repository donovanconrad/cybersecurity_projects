## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Diagrams/DConrad-Network-Diagram-Web-AND-Elk-Deployment-Azure.png](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML playbook files may be used to install only certain pieces of it, such as Filebeat.

  - _Ansible/setup-web-playbook.yml_
  - _Ansible/install-elk-playbook.yml_
  - _Ansible/filebeat-playbook.yml_
  - _Ansible/metricbeat-playbook.yml_

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
- _Load balancers protect direct access to any of the webservers. It only allows designated traffic through and balances that traffic between the available servers._ 
- _The advantage of a jump box it to have only one outside access point to the network other than web traffic. It provides a gateway to the web servers and elk server so that they cannot be accessed directly from the public internet._

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metrics and system logs.
- _Filebeat monitors and collects log data on hte server and forwards to Elasticsearch or Logstash for indexing._
- _Metricbeat collects metrics from the operating system and services running on the serverand forwards to Elasticsearch or Logstash for indexing._

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
- _Personal Home IP Not Divulged - See network rules_

Machines within the network can only be accessed by Jump-Box-VM.
- _From Jump-Box-VM (10.0.0.4) is the only way to get to the Web servers or the Elk server._

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
- _It can be deployed consistently and reliably to multiple servers._

The playbook implements the following tasks:
- _Install docker.io_
- _Install python_
- _Install docker_
- _Set virtual memory vlaue_
- _Install and run the ELK container_

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Screenshots/docker-ps-elk.png](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _Web-1 10.0.0.5_
- _Web-2 10.0.0.8_
- _Web-3 10.0.0.9_

We have installed the following Beats on these machines:
- _Filebeats_
- _Metricbeats_

These Beats allow us to collect the following information from each machine:
- _Filebbeats collects system logs such as SSH logins and sudo commands. This lets us know who is doing what on the servers._
- _Metricbeats collects metrics such as CPU and Memory useage, Network I/O, etc. THis allows us to know if more servers need to be deployed if the existing ones are maxed out._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- _Attach to the Ansible container._
- _Copy the install-elk-playbook.yml file to /etc/ansible._
- _Update the /etc/ansible/hosts file to include the header name and IP entry for the ELK server (10.1.0.4 ansible_python_interpreter=/usr/bin/python3)_
- Run the playbook, and navigate to the Kibana website to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _The playbook is the Ansible/install-elk-playbook.yml file. It gets copied to /etc/ansible within the Ansible container._
- _You update the /etc/ansible/hosts file to make Ansible run the playbook on a specific machine. You specify which machines(s) to run the ELK playbook on versus fileboeat, etc. by the headers in hte /etc/ansible/hosts file. the webservers are grouped together under one header [WEB] and the ELK server is under another header [ELK].__
- _To ensure the ELK server is running, you access http://23.98.131.114:5601/app/kibana_

- _The specific commands needed to download the playbook and update required files are:_
- _Navigate to my Github repository https://github.com/donovanconrad/cybersecurity_projects.git_
- _Navigate to the Ansible folder and right-click and save the install-elk-playbook.yml file_
- _copy the file to your Ansible container on your jump box._
- _Edit the file for the correct header for the hosts section at the top of the file. Make sure it matches your entry in /etc/ansible/hosts_
- _Execute the command: ansible-playbook install-elk-playbook.yml_
- _Prior to running the playbook, ensure SSH access is available from the jump box to the elk server. You will need to set up the SSH key to make this work._ 