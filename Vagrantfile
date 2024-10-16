Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.define "manager01" do |manager|
    manager.vm.hostname = "manager01"
    manager.vm.network "private_network", ip: "192.168.56.10"
    manager.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    manager.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "0.0.0.0"
    manager.vm.provision "shell", path: "scripts/install_docker.sh"
    manager.vm.provision "shell", path: "scripts/init_swarm.sh", privileged: false
  end

  ["worker01", "worker02"].each_with_index do |name, index|
    config.vm.define name do |worker|
      worker.vm.hostname = name
      worker.vm.network "private_network", ip: "192.168.56.1#{index + 1}"
      worker.vm.provision "shell", path: "scripts/install_docker.sh"
      worker.vm.provision "shell", path: "scripts/join_swarm.sh", privileged: true
    end
  end
end

