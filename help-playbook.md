# run playbook setup
ansible-playbook -i inventory.yml /app/playbooks/2_setup.yml 

# run playbook deploy
ansible-playbook -i inventory.ini /app/playbooks/2_deploy.yml \
  --extra-vars "@/app/secrets/secrets.yml" \
  --ask-vault-pass

# run playbook deploy_DBS
ansible-playbook -i inventory.yml /app/playbooks/3_deploy_dbs.yml 

# run playbook deploy
ansible-playbook -i inventory.yml /app/playbooks/3_deploy.yml 

# run playbook ssl
ansible-playbook -i inventory.yml /app/playbooks/4_ssl.yml 

# run playbook pre setup
ansible-playbook -i inventory.yml /app/playbooks/1_pre_setup.yml \
  --extra-vars "@/app/secrets/secrets.yml" \
  --ask-vault-pass

ansible-playbook /app/playbooks/setup/mongodb.yml
ansible-playbook /app/playbooks/setup/docker.yml

ansible-playbook -i hosts.ini /app/playbooks/1_setup.yml


# Inside the Container 
eval "$(ssh-agent -s)"
ssh-add /root/.ssh/id_rsa 


docker run -it --rm --name ansible-container \
    -v $SSH_AUTH_SOCK:/run/ssh-agent.sock \
    -e SSH_AUTH_SOCK=/run/ssh-agent.sock \
    ansible-image


docker inspect ansible-container     outside
ls -l /run/ssh-agent.sock            inside

docker run -it ansible-docker
ansible --version
apt list -a ansible


ansible-inventory -i inventory.ini --list

ansible my_vps -m ping -i inventory.ini
ansible-playbook -i inventory.ini /app/playbooks/site.yml

for playbook in /app/playbooks/site.yml /app/playbooks/basic.yml; do
    ansible-playbook -i inventory.ini "$playbook" 
done


sudo iptables -L -v -n
systemctl start systemd

systemctl status nginx


ansible all -m command -a "uptime"
ansible all -m apt -a "name=nginx state=latest" --become

git add .
git commit -m "dbs setup updated"
git push origin main





























Step 1: Install Docker
sudo apt-get update
sudo apt install docker-ce
docker version
sudo usermod -aG docker labsuser
docker images

Step 2: Write Dockerfile and create Ansible image
FROM ubuntu:20.04
ENV ANSIBLE_VERSION 2.9.17
RUN apt-get update; \
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get clean all
RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible

Step 3: Build the image using the following Docker command
docker build -t ansible:latest .

Step 4: Validate image creation by checking image list
docker images
or
docker image ls

Step 5: Run Ansible inside a docker container
docker run -it ansible
ansible --version

Step 6: [Optional] Push your Ansible image to Docker Hub
docker login
docker push ansible:latest
docker tag ansible sk12k/ansible
docker image ls
docker push sk12k/ansible