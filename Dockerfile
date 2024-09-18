FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    sudo \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Ansible PPA
RUN sudo apt-add-repository ppa:ansible/ansible
   
# Update package lists
RUN apt-get update

# Install Ansible
# RUN apt-get install -y ansible
RUN apt-get install -y ansible=5.10.0-1ppa~focal

WORKDIR /app

# Add Ansible configuration, inventory, and playbooks
COPY ansible/ansible.cfg /app/ansible.cfg
COPY ansible/inventory.ini /app/inventory.ini
COPY ansible/playbooks /app/playbooks

# Optionally, run the playbook (comment out if you don't want this on build)
# RUN ansible-playbook /app/playbooks/site.yml

# Clean up to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

