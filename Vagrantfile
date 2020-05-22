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
    config.vm.provision "setEnv" , type: "shell" do |s|
      s.inline = "echo \"set http_proxy => $http_proxy and https_proxy => $https_proxy\" "
      s.env = { http_proxy: ENV["http_proxy"], https_proxy: ENV["https_proxy"] }
      s.run = "always"
    end

    config.vm.provision "setYumProxy", type: "shell", path: "scripts/setYumProxy.sh"
    config.vm.provision "setYumProxy", type: "shell", path: "scripts/updateSystem.sh"
    config.vm.provision "installVagrant", type: "shell", path: "scripts/installVagrant.sh"
  end
end
