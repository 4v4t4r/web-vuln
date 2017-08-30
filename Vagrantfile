#
# Vagrant script for setting up a Nginx server with php-fpm and damn vulnerable web app
#

Vagrant.configure("2") do |config|

## VM configuration
	config.vm.box = "ubuntu/xenial64"
	config.vm.box_url = "https://vagrantcloud.com/ubuntu/xenial64"
	config.vm.network "private_network", type: "dhcp"
	
    config.vm.define :vuln do |vuln|
		vuln.vm.provider :virtualbox do |v|
			v.name = "web-vuln"
			v.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 2]
		end
		vuln.vm.hostname = "web-vuln"
		vuln.vm.provision :shell, :path => "dvwa-bootstrap.sh"
		vuln.vm.provision :shell, :path => "mutillidae-bootstrap.sh"
		vuln.vm.provision :shell, :path => "webgoat-bootstrap.sh"
	end
end
