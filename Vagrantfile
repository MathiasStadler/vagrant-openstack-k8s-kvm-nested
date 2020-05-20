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
    config.vm.provision "setYumProxy", type: "shell" ,path: "scripts/setYumProxy.sh"
    config.vm.provision "setYumProxy", type: "shell" ,path: "scripts/updateSystem.sh"
    config.vm.provision "installVagrnt", type: "shell", path: "scripts/installVagrant.sh"
    
  end
end
