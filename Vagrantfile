#
# Vagrant script for setting up a Nginx server with php-fpm and damn vulnerable web app
#

Vagrant.configure("2") do |config|

## VM configuration
	config.vm.box = 'ubuntu/xenial64'
	config.vm.box_url = ''
	config.vm.network "private_network", type: "dhcp"
	
    config.vm.define :dvwa do |dvwa|
		dvwa.vm.provider :virtualbox do |v|
<<<<<<< HEAD
			v.name = "web-vuln"
			v.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 2]
		end
		dvwa.vm.hostname = "web-vuln"
		dvwa.vm.provision :shell, :path => "dvwa-bootstrap.sh"
		dvwa.vm.provision :shell, :path => "mutillidae-bootstrap.sh"
		dvwa.vm.provision :shell, :path => "webgoat-bootstrap.sh"
=======
			v.name = "dvwa"
			v.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 2]
		end
		dvwa.vm.hostname = "dvwa"
		dvwa.vm.provision :shell, :path => "dvwa-bootstrap.sh"
#		dvwa.vm.provision :shell, :path => "mutillidae-bootstrap.sh"
>>>>>>> b41cf51209886e1fa0380a189f7b5a1918a9fc2c
	end
end
