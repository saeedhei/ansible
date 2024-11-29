ansible-vault create /app/secrets/secrets.yml
ansible_ssh_pass: ...
ansible-vault edit /app/secrets/secrets.yml
// inventory.ini
[vps]
0.0.0.0 ansible_user=root
// run playbook command
ansible-playbook -i inventory.ini setup_vps.yml --extra-vars "@/app/secrets/secrets.yml"


ansible_ssh_pass: 
