# vagrant-openstack-k8s-kvm-nested

**WIP**


## housekeeping

```bash
# found space
cd && cd playground
# clone 
git clone https://github.com/MathiasStadler/vagrant-openstack-k8s-kvm-nested.git
# start VSCODE inside browser 
CID=$(docker run -it -d -p 0:8080 -v "${PWD}:/home/coder/project" -u "$(id -u):$(id -g)" codercom/code-server:3.3.0-rc.7  --cert)
#found port of container
docker inspect -f '{{ (index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort }}' ${CID}
# found password
docker logs ${CID} |grep Password
# open with browser of your choice

# add to the terminal with your data
git config --global user.name "Mathias Stadler"
git config --global user.EMAIL "email@mathias-stadler.de"
# https://help.github.com/en/github/using-git/caching-your-github-password-in-git
git config --global credential.helper 'cache --timeout=3600'

# add extension
code-server --install-extension streetsidesoftware.code-spell-checker
code-server --install-extension davidanson.vscode-markdownlint
code-server --install-extension eamodio.gitlens
code-server --install-extension gruntfuggly.todo-tree
# create folder for todo-tree extension
mkdir -p /home/coder/.local/share/code-server/User/globalStorage/gruntfuggly.todo-tree
code-server --install-extension redhat.vscode-yaml
code-server --install-extension timonwong.shellcheck
code-server --install-extension foxundermoon.shell-format
code-server --install-extension  ms-azuretools.vscode-docker
code-server --install-extension rebornix.ruby
code-server --install-extension siliconsenthil.rufo-vscode
code-server --list-extensions
```


## install vagrant on centos/8

- dowmlod for

```bash
#!/bin/bash
# switch to tmp
cd && cd /tmp
# download
curl https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.rpm -O
# install
sudo dnf install -y vagrant_2.2.9_x86_64.rpm
```

