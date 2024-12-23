# Build Image
docker build -t ansible-image .

# git Terminal
docker ps -q -f name=ansible-container && docker stop ansible-container; \
MSYS_NO_PATHCONV=1 docker run -it --rm \
--name ansible-container \
-v $(pwd)/ansible/playbooks:/app/playbooks:ro \
-v $(pwd)/ansible/secrets:/app/secrets:ro \
-v $(pwd)/ansible/server:/app/server:ro \
-v $(pwd)/ansible/inventory.yml:/app/inventory.yml:ro \
ansible-image



docker run -it --rm --name ansible-container \
    -v $SSH_AUTH_SOCK:/run/ssh-agent.sock \
    -e SSH_AUTH_SOCK=/run/ssh-agent.sock \
    ansible-image


docker inspect ansible-container     outside
ls -l /run/ssh-agent.sock            inside

docker run -it ansible-docker
ansible --version
apt list -a ansible


docker ps
docker exec -it <container_name_or_id> /bin/bash
docker exec -it couchdb /bin/bash

<!-- Swarm -->
docker info | grep Swarm
[Swarm: active]
docker node ls

docker service ps couchdb --filter "desired-state=running" --format "{{.Node}}"
docker service ls
docker service ps couchdb

# /docker-projects
# ├── project1
# │   ├── docker-compose.yml
# │   ├── .env
# │   ├── data/               # Persistent data (if needed)
# │   ├── logs/               # Log files (if needed)
# │   ├── src/                # Source code (optional)
# │   ├── Dockerfile          # Optional Dockerfile for custom images
# │   └── README.md           # Optional documentation for the project
# ├── project2
# │   ├── docker-compose.yml
# │   ├── .env
# │   ├── data/
# │   ├── logs/
# │   ├── src/
# │   └── README.md
# └── shared/                 # Shared resources across projects (e.g., networks, volumes)


