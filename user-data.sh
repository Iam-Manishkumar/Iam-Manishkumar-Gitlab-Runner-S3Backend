#!/bin/bash

# Update system
sudo apt update

# Install htop and docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"   
sudo curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt-get install docker-ce docker gitlab-runner -y

# Enable Services at startup
sudo systemctl enable docker
sudo systemctl enable gitlab-runner

# Add gitlab-runner config
mkdir -p /etc/gitlab-runner
cat > /etc/gitlab-runner/config.toml <<- EOM
concurrent = ${GITLAB_CONCURRENT_JOB}
check_interval = ${GITLAB_CHECK_INTERVAL}

EOM

# Register gitlab runner
gitlab-runner register --non-interactive \
                       --name "${GITLAB_RUNNER_NAME}" \
                       --url "${GITLAB_RUNNER_URL}" \
                       --registration-token "${GITLAB_RUNNER_TOKEN}" \
                       --executor docker \
                       --tag-list "${GITLAB_RUNNER_TAGS}" \
                       --docker-image "${GITLAB_RUNNER_DOCKER_IMAGE}"

# Start services
sudo systemctl status docker \| grep -i running
if [ "$?" -ne 0]
then
    sudo systemctl start docker
fi

# Check service status
sudo systemctl status gitlab-runner \| grep -i running
if [ "$?" -ne 0]
then
    sudo systemctl start gitlab-runner
fi