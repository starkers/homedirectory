#!/usr/bin/env bash
set -e

function is_installed_rpm(){
  set +e
  rpm -q ${1} 1>/dev/null 2>/dev/null
  rc=$?
  set -e
  return ${rc}
}

if ! is_installed_rpm google-cloud-sdk ; then


# Update YUM with Cloud SDK repo information:
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

# The indentation for the 2nd line of gpgkey is important.

# Install the Cloud SDK
sudo dnf install google-cloud-sdk -y

else
  echo gcloud already installed
fi
