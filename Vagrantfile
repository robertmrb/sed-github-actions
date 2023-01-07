Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.define "github-runner" do |gh|
    gh.vm.hostname = "github-runner"
    gh.vm.network "private_network", ip: "192.168.56.14"
    gh.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "1"
    end
    gh.vm.provision "shell", inline: <<-SHELL
      apt update && apt upgrade -y
      apt install shellcheck
    SHELL
  end
end