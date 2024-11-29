#!/bin/bash
# start-ssh-agent.sh

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add the SSH key
ssh-add /root/.ssh/id_rsa

# Keep the container running with a shell
exec /bin/bash
