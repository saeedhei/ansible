sudo nano ~/.ssh/authorized_keys

Copy-Paste: Open id_rsa.pub on your local machine and copy its contents. In the server terminal (nano editor), paste the contents at the end of the authorized_keys file.

chmod 600 ~/.ssh/authorized_keys

Error writing /root/.ssh/authorized_keys: No such file or directory:
sudo mkdir /root/.ssh 
sudo chmod 700 /root/.ssh

# update this known_hosts too

ansible-playbook /app/playbooks/1_pre_setup.yml









// The -k flag is very important on your first playbook run, since it allows you to enter your SSH password
ansible-playbook /app/playbooks/1_pre_setup.yml -l server1 -u root -k

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook /app/playbooks/1_pre_setup.yml \
  --extra-vars "@/app/secrets/secrets.yml" \
  --ask-vault-pass

[defaults]
host_key_checking = False