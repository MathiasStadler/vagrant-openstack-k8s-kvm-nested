# vagrant-openstack-k8s-kvm-nested

**WIP**


## housekeeping

```bash
cd && cd playground
git clone 
CID=$(docker run -it -d -p 0:8080 -v "${PWD}:/home/coder/project" -u "$(id -u):$(id -g)" codercom/code-server:3.3.0-rc.7  --cert)
#found port of container
docker inspect -f '{{ (index (index .NetworkSettings.Ports "80/tcp") 0).HostPort }}' $(CID) 8080
# found passwd
docker logs $(CID) |grep Password
# open with broser of your choise

# add to the terminal with your data
git config --global user.name "Mathias Stadler"
git config --global user.EMAIL "email@mathias-stadler.de"
# https://help.github.com/en/github/using-git/caching-your-github-password-in-git
git config --global credential.helper 'cache --timeout=3600'