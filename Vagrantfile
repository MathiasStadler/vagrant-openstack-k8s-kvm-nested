#from here https://github.com/hashicorp/vagrant/issues/7015
$set_environment_variables = <<SCRIPT
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF
# squid environment variables.
export http_proxy=#{ENV['http_proxy']}
export https_proxy=#{ENV['https_proxy']}
EOF
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.define :nested_host do |nested_host|
    nested_host.vm.box = "centos/8"
    nested_host.vm.provider :libvirt do |domain|
      domain.memory = 14336
      domain.cpus = 4
      domain.nested = true
      domain.volume_cache = "none"
      domain.cpu_mode = "host-passthrough"
      domain.machine_virtual_size = 60
    end
    # from here https://stackoverflow.com/questions/19648088/pass-environment-variables-to-vagrant-shell-provisioner
      config.vm.provision "setEnv" , type: "shell", inline: $set_environment_variables, run: "always"

    config.vm.provision "getEnv" , type: "shell" , run: "always" do |s|
      s.inline = "env"
    end

    config.vm.provision "setYumProxy", type: "shell", path: "scripts/setYumProxy.sh"
    config.vm.provision "updateSystem", type: "shell", path: "scripts/updateSystem.sh"
    config.vm.provision "installVagrant", type: "shell", path: "scripts/installVagrant.sh"
  end
end
