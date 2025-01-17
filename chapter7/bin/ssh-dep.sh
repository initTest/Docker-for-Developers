#!/usr/bin/env bash
set -euo pipefail
port=${port:-80}
prod="${shipit_prod_user}@${shipit_prod_host}"
staging="${shipit_staging_user:-centos}@${shipit_staging_host:-staging.example.com}"
image=${image:-dockerfordevelopers/shipitclicker:latest}
if [[ "$target" = "staging" ]]; then
    targetEnv="$staging"
else
    targetEnv="$prod"
fi
set -euo pipefail
cd /Docker-for-Developers/chapter7
git fetch
git reset --hard HEAD
git checkout -f origin/"$GIT_BRANCH"
docker pull "$image"
set -a
DOCKER_IMAGE="$image"
PORT="$port"
bin/restart.sh
EOF
