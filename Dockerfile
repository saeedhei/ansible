FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    bash   

# Add Ansible PPA
RUN apt-add-repository ppa:ansible/ansible
   
# Update package lists
RUN apt-get update

# Install Ansible
# RUN apt-get install -y ansible
RUN apt-get install -y ansible=5.10.0-1ppa~focal

WORKDIR /app

# Add Ansible configuration, inventory, and playbooks
# COPY ansible/ansible.cfg /app/ansible.cfg
COPY ansible /app

# Optionally, run the playbook (comment out if you don't want this on build)
# RUN ansible-playbook /app/playbooks/site.yml

# Clean up to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Copy the entry point script into the image
COPY sh/start-ssh-agent.sh /usr/local/bin/start-ssh-agent.sh
# Make the script executable
RUN chmod +x /usr/local/bin/start-ssh-agent.sh
# Set the entry point to the script
ENTRYPOINT ["/usr/local/bin/start-ssh-agent.sh"]

# Add your local SSH keys   
COPY ssh /root/.ssh

# Set correct permissions for the SSH private key
RUN chmod 600 /root/.ssh/id_rsa

# Set /bin/bash as the default shell
CMD ["/bin/bash"]
