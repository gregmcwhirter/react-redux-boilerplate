Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty32"

  config.vm.network "private_network", ip: "192.168.33.54"
  config.vm.network :forwarded_port, guest: 22, host: 2254, id: 'ssh'
  
  # Use this to get shared folder permissions right
  config.vm.synced_folder ".", "/vagrant", 
    id: "couture",
    owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=775,fmode=664"]

  # Yet another fix for running Vagrant on Windows 7 and Dell Studio 540!!
  config.vm.provider "virtualbox" do |vb|
    ### Change network card to PCnet-FAST III
    # For NAT adapter
    vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
    # For host-only adapter
    vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
  end

  # config.vm.provision "shell", path: "provision.sh"

end