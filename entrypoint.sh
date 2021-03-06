#!/bin/bash

# Set path
echo '::group::Configuring path'
WORKPATH=$GITHUB_WORKSPACE/$INPUT_PATH
# Set path permision
sudo chown -R builder $WORKPATH
echo '::endgroup::'

echo '::group::Initializing ~/.ssh directory'
mkdir -pv /home/builder/.ssh
touch /home/builder/.ssh/known_hosts
cp -v /.ssh/config /home/builder/.ssh/config
chown -vR builder:builder /home/builder
chmod -vR 600 /home/builder/.ssh/*
echo '::endgroup::'

exec runuser builder --command 'bash -l -c /scripts/git.sh'
