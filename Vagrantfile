#
# Vagrant script for setting up a Nginx server with php-fpm and damn vulnerable web app
#

Vagrant.configure("2") do |config|

## VM configuration
	config.vm.box = 'ubuntu/xenial64'
	config.vm.box_url = ''
	config.vm.network "private_network", type: "dhcp"
	
    config.vm.define :web-vuln do |web-vuln|
		dvwa.vm.provider :virtualbox do |v|
			v.name = "web-vuln"
			v.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 2]
		end
		web-vuln.vm.hostname = "web-vuln"
		web-vuln.vm.provision :shell, :path => "dvwa-bootstrap.sh"
		web-vuln.vm.provision :shell, :path => "mutillidae-bootstrap.sh"
		web-vuln.vm.provision :shell, :path => "webgoat-bootstrap.sh"
	end
end
